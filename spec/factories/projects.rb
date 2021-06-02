FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end
end