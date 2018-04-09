FactoryBot.define do
  factory :developer do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
  end
end
