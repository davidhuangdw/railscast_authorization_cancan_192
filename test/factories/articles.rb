FactoryGirl.define do
  factory :article do
    sequence(:name) {|n| "title#{n}"}
    sequence(:content) {|n| "title#{n}"}
  end
end
