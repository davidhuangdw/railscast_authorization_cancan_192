FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}"}
    password '123'
    password_confirmation '123'

    factory :admin do
      roles_mask 1
    end
    factory :moderate do
      roles_mask 2
    end
  end
end
