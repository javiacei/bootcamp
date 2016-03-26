class Prework
  include ActiveModel::Model

  attr_reader :course, :student

  def initialize(course:, student:)
    @course = course
    @student = student
  end

  def subscribed?
    @student.subscribed? @course
  end

  def progress
    return 0 if exercises.count == 0

    exercises_done.count * 100 / exercises.count
  end

  def exercises(state = nil)
    conditions = {
      course_id: @course.id,
      user_id: @student.id,
      state: state
    }.compact

    ExerciseStatus.where(conditions)
  end

  def serialize
    {
      data: {
        type: 'prework',
        attributes: {
          course: {
            name: course.name
          },
          progress: "#{progress} %",
          exercices: exercises.map do |e|
            {
              resolution_url: e.resolution_url,
              state: e.state_humanize,
              description: e.exercise.description
            }
          end
        }
      }
    }
  end

  private

  def exercises_done
    exercises(ExerciseStatus::DONE)
  end
end
