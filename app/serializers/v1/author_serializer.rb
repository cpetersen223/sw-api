module V1
  # Serialize Author # V1::AuthorSerializer
  class AuthorSerializer < ActiveModel::Serializer
    attributes :name, :email, :birth_date
    has_many :publications, serializer: PublicationSerializer
  end
end
