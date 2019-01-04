# V1::AuthorsControllers
module V1
  class AuthorsController < ::V1::MainController
    before_action :set_author, only: [:show, :update, :destroy]

    def index
      @authors = Author.all
      json_response(@authors)
    end

    def create
      @author = Author.create!(author_params)
      json_response(@author, :created)
    end

    def show
      json_response(@author)
    end

    def update
      @author.update(author_params)
      head :no_content
    end

    def destroy
      @author.destroy
      head :no_content
    end

    private

    def author_params
      params.permit(:name, :email, :birth_date)
    end

    def set_author
      @author = Author.find(params[:id])
    end
  end
end