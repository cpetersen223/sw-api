module V1
  # Serialize Author # V1::AuthorSerializer
  class AuthorSerializer < ActiveModel::Serializer
    attributes :name, :email, :birth_date
    has_many :publications, serializer: PublicationSerializer

    def birth_date
      object.birth_date.iso8601
    end
  end
end
