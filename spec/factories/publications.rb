# == Schema Information
#
# Table name: publications
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  date       :date
#  time       :time
#  author_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :publication do
    title   { Faker::Book.title }
    body    { Faker::Lorem.paragraph }
    author

    trait :reindex do
      after(:create) do |product, _evaluator|
        product.reindex(refresh: true)
      end
    end
  end
end
