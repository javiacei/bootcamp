class StudentsController < ApplicationController
  before_action :doorkeeper_authorize!

  def show
    render json: student
  end

  private

  def student
    @student ||= User.find_by!(id: params[:id])
  end
end
