module Users
  class Prework < ActiveRecord::Base
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :course, class_name: 'Course', foreign_key: 'course_id'
    belongs_to :exercise, class_name: 'Exercise', foreign_key: 'exercise_id'
  end
end
