class Course < ActiveRecord::Base
  has_many :exercises, foreign_key: :course_id
end
