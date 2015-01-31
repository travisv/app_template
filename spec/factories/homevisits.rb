# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homevisit do
    date_of_departure { Faker::Date }
    date_of_return { Faker::Date }
    client_id { Faker::Number.digit }
  end
end
