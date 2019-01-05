module V1
  class AuthorPublicationsSerializer < ActiveModel::Serializer
    attributes :body, :date, :time, :title
  end
end
