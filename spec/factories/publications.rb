FactoryBot.define do
  factory :publication do
    title { "MyString" }
    body { "MyText" }
    date { "2019-01-03" }
    time { "2019-01-03 20:50:16" }
    author { nil }
  end
end
