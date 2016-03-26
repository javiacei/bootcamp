FactoryGirl.define do
  factory :user, aliases: [:student] do
    transient do
      admin false
    end

    name      { Faker::Name.name }
    surname   { Faker::Name.last_name }
    email     { Faker::Internet.email }
    password  '12345678'
  end
end
