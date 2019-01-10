module V1
  # V1::AuthorsControllers
  class AuthorsController < ::V1::MainController
    before_action :set_author, only: %i[show update destroy]

    def index
      @authors = Author.all
      json_response @authors, each_serializer: V1::AuthorsSerializer
    end

    def create
      author = Author.create!(author_params)
      json_response author, :created
    end

    def show
      json_response @author
    end

    def update
      @author.update!(author_params)
      head :no_content
    end

    def destroy
      @author.destroy
      head :no_content
    end

    private

    def author_params
      parameters = params.permit(:name,
                                 :email,
                                 :birth_date,
                                 publications:
                                    %i[body title])
      if parameters.key? :publications
        parameters[:publications_attributes] = parameters.delete :publications
      end
      parameters.permit!
    end

    def set_author
      @author = Author.includes(:publications).find(params[:id])
    end
  end
end