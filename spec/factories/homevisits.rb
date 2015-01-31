# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homevisit do
    date_of_departure "2015-01-31"
    date_of_return "MyString"
    client nil
  end
end
