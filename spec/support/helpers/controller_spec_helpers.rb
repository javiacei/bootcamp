module Helpers
  module ControllerSpec
    def authorization_header(access_token)
      @request.env['HTTP_AUTHORIZATION'] = "Bearer #{access_token}"
    end

    def authenticate(app, user = nil)
      attrs = { application_id: app.id }.merge(user ? { resource_owner_id: user.id } : {})

      access_token = FactoryGirl.create(:access_token, attrs)

      authorization_header access_token.token
    end
  end
end
