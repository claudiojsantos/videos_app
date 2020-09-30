FactoryBot.define do
  factory :video do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    user { FactoryBot.create(:user) }
    views { 0 }
  end
end
