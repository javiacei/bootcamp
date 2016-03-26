class SubscriptionsController < ApplicationController
  before_action :doorkeeper_authorize!

  def create
    subscription = Courses::Subscribe.new(
      course: course,
      student: current_user
    ).execute

    render json: {}, status: :created
  end

  private

  def course
    @course ||= Course.find_by!(id: params[:course_id])
  end
end
