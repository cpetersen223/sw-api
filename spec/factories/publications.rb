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
    date    { Faker::Date.between(Date.today - 65.years, Date.today) }
    time    { Faker::Time.backward }
    author
  end
end
