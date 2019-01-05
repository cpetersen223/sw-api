# == Schema Information
#
# Table name: authors
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  email      :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :author do
    name        { Faker::Name.name }
    email       { Faker::Internet.safe_email }
    birth_date  { Faker::Date.birthday }

    factory :author_with_publications do
      transient do
        count { 5 }
      end

      after(:create) do |author, evaluator|
        create_list(:publication, evaluator.count, author: author)
      end
    end
  end
end
