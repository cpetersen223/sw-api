module V1
  class AuthorPublicationsSerializer < ActiveModel::Serializer
    attributes :id, :body, :title, :date

    def date
      object.created_at.iso8601
    end
  end
end
