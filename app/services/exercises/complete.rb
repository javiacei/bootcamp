module Exercises
  class Complete
    def initialize(exercise:, student:, form:)
      @exercise = exercise
      @student = student
      @attrs = form.attributes
    end

    def execute
      exercise_status = ExerciseStatus.find_by(
        course_id: @exercise.course_id,
        exercise_id: @exercise.id,
        user_id: @student.id
      ) || ExerciseStatus.new

      exercise_status.user_id = @student.id
      exercise_status.course_id = @exercise.course_id
      exercise_status.exercise_id = @exercise.id
      exercise_status.resolution_url = @attrs[:url]
      exercise_status.state = ExerciseStatus::DONE
      exercise_status.save

      exercise_status
    end
  end
end
