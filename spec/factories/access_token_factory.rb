FactoryGirl.define do
  factory :access_token, class: Doorkeeper::AccessToken do
    transient do
      token Faker::Internet.password(64)
    end

    # Attributes
    application

    # Callbacks
    after :create do |access_token, evaluator|
      access_token.token = evaluator.token
      access_token.save
    end
  end
end
