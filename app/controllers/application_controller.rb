class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def current_user
    return nil unless doorkeeper_token[:resource_owner_id]
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end

  private

  def not_found
    obj = { errors: [{ status: '404', detail: 'not found' }] }
    render json: obj, status: 404
  end

  def bad_request
    obj = { errors: [{ status: '400', detail: 'bad request' }] }
    render json: obj, status: 400
  end
end
