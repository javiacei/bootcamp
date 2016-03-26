class ExercisesController < ApplicationController
  include UnserializeJsonApiFormat

  before_action :doorkeeper_authorize!

  def update
    input = unserialize_json_api_format(params)
    complete_form = Exercises::CompleteForm.new(input)

    if complete_form.valid?
      exercise_status = Exercises::Complete.new(
        exercise: exercise,
        student: current_user,
        form: complete_form
      ).execute

      render json: exercise_status
    else
      render json: complete_form, status: :unprocessable_entity,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  private

  def exercise
    @exercise ||= Exercise.find_by!(course_id: params[:course_id], number: params[:number])
  end
end
