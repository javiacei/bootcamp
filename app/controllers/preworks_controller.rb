class PreworksController < ApplicationController
  before_action :doorkeeper_authorize!

  def show
    return not_found unless prework.subscribed?

    render json: prework.serialize
  end

  private

  def prework
    @course ||= Course.find_by!(id: params[:course_id])
    @prework ||= Prework.new(course: @course, student: current_user)
  end
end
