FactoryGirl.define do
  factory :application, class: Doorkeeper::Application do
    name          { Faker::App.name }
    uid           { Faker::Internet.password(64) }
    secret        { Faker::Internet.password(64) }
    redirect_uri  { Faker::Internet.url }
  end
end
