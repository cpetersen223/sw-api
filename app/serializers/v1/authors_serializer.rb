module V1
  # Serialize Author # V1::AuthorSerializer
  class AuthorsSerializer < ActiveModel::Serializer
    attributes :name, :email, :birth_date
  end
end