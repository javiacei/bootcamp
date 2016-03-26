class ExerciseStatus < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :course, class_name: 'Course', foreign_key: 'course_id'
  belongs_to :exercise, class_name: 'Exercise', foreign_key: 'exercise_id'

  STATES = ['to do', 'in progress', 'done'].freeze

  def state_humanize
    STATUS[state]
  end
end
