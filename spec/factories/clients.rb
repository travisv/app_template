# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    factory :invalid_client do
      name nil
    end
  end
end
