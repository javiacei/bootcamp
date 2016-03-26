class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercise_statuses, foreign_key: :user_id

  def subscribed?(course)
    exercise_statuses.exists?(user_id: id, course_id: course.id)
  end
end
