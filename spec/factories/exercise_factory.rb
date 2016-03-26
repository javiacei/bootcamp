FactoryGirl.define do
  factory :exercise do
    number { Faker::Number.between(1, 50) }
    description { Faker::Lorem.sentence }
  end
end
