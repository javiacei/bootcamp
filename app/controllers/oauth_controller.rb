class OauthController < ApplicationController
  def denied
    skip_authorization
    render json: { error: _('Denied') }, status: :unauthorized
  end
end
