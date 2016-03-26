# User
User.delete_all
FactoryGirl.create(:user, name: 'Francisco Javier Aceituno', email: 'javiacei@ironhack-bootcamp.com')

# OAuth
Doorkeeper::Application.delete_all
Doorkeeper::AccessToken.delete_all

FactoryGirl.create(
  :application,
   name: 'bootcamp_app_test',
   uid: '7580191c5fabf79c24c54d3ac94d6f78f555a5335d784dc185c04fdd98986924',
   secret: '68b8b958c5df1f0f6c7ca1854d59d5c8330fe837197f75f88da162aa51dbcca9',
   redirect_uri: 'http://localhost:3000/oauth/callback'
)

# Access token to use in DHC
FactoryGirl.create(
  :access_token,
  token: 'b1d00718ec57dcee2e39db98338b5537503ced09dd9d428aeafa1c118c21e4e0'
)
