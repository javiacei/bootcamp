class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :surname, :slack_username
end
