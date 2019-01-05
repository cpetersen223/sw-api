module V1
  class PublicationSerializer < ActiveModel::Serializer
    attributes :body, :date, :time, :title
    belongs_to :author, serializer: AuthorsSerializer
  end
end
