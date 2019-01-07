module V1
  class PublicationSerializer < ActiveModel::Serializer
    attributes :body, :title, :date
    belongs_to :author, serializer: AuthorsSerializer

    def date
      object.created_at.iso8601
    end
  end
end
