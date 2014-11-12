FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}"}
    password '123'
    password_confirmation '123'
  end
end
