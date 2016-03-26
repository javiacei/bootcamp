module Courses
  class Subscribe
    def initialize(course:, student:)
      @course = course
      @student = student
    end

    def execute
      @course.exercises.each do |exercise|
        exercise_status = ExerciseStatus.find_by(exercise_id: exercise.id, user_id: @student.id)

        unless exercise_status
          exercise_status = ExerciseStatus.new.tap do |e|
            e.user_id = @student.id
            e.course_id = exercise.course_id
            e.exercise_id = exercise.id
          end

          exercise_status.save
        end
      end
    end
  end
end
