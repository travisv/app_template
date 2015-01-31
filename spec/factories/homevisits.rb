# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homevisit do
    date_of_departure { Faker::Date.between(100.days.ago, Date.today) }
    date_of_return { Faker::Date.between(100.days.ago, Date.today) }
    client_id { Faker::Number.digit }
  end
end
