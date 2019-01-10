module V1
  # Serialize Author # V1::AuthorSerializer
  class AuthorsSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birth_date

    def birth_date
      object.birth_date.iso8601
    end
  end
end