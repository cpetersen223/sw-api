# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  p '--- Creating new author ---'
  author = Author.create(name: Faker::RickAndMorty.character,
                         email: Faker::Internet.safe_email,
                         birth_date: Faker::Date.birthday)
  10.times do
    p "--- Creating publications of author: #{author.name} ---"
    author.publications.create(title: Faker::Book.title,
                               body: Faker::Lorem.paragraph,
                               date: Faker::Date.between(Date.today - 65.years, Date.today),
                               time: Faker::Time.backward)
  end
end