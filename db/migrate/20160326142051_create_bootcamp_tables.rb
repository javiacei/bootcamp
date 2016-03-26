class CreateBootcampTables < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :exercises do |t|
      t.references :course, index: true
      t.integer    :number, null: false
      t.text       :description, null: false

      t.timestamps
    end

    add_foreign_key :exercises, :courses, column: :course_id, on_delete: :cascade
    add_index :exercises, [:course_id, :number], unique: true

    create_table :exercise_status do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :exercise, index: true
      t.integer    :state, default: 0, limit: 1
      t.string     :resolution_url

      t.timestamps
    end

    add_foreign_key :exercise_status, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :exercise_status, :courses, column: :course_id, on_delete: :cascade
    add_foreign_key :exercise_status, :exercises, column: :exercise_id, on_delete: :cascade

    add_index :exercise_status, [:user_id, :course_id, :exercise_id], unique: true
  end
end
