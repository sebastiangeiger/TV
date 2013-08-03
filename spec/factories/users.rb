# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email {|n| "user_#{n}@example.com" }
    password "mySecret"
  end
end
