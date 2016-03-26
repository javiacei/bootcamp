FactoryGirl.define do
  factory :course do
    name { Faker::Commerce.product_name }
  end
end
