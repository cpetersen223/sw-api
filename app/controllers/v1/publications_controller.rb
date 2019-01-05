module V1
  # V1::PublicationsControllers
  class PublicationsController < ::V1::MainController
    before_action :set_author, only: :create
    before_action :set_publication, only: %i[show update destroy]

    def index
      @publications = Publication.order(date: :desc)
      json_response @publications
    end

    def show
      json_response @publication
    end

    def create
      @author.publications.create! publication_params
      json_response @author, :created
    end

    def update
      @publication.update publication_params
      head :no_content
    end

    def destroy
      @publication.destroy
      head :no_content
    end

    private

    def publication_params
      params.permit(:title, :body, :date, :time)
    end

    def set_author
      @author = Author.includes(:publications).find params[:author_id]
    end

    def set_publication
      @publication = Publication.find params[:id]
    end
  end
end