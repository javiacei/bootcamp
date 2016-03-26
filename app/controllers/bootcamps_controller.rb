class BootcampsController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    render json: []
  end
end
