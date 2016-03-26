FactoryGirl.define do
  factory :course do
    name { Faker::Commerce.product_name }

    factory :course_with_exercises do
      transient do
        exercises_count 10
      end

      after(:create) do |course, evaluator|
        exercises = []

        evaluator.exercises_count.times do |n|
          exercises << create(:exercise, number: n + 1)
        end

        course.exercise_ids = exercises.map(&:id)
      end
    end
  end
end
