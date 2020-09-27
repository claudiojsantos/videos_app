FactoryBot.define do
  factory :video do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    views { 0 }
  end
end
