class CreateBootcampTables < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :exercises do |t|
      t.string :question, null: false

      t.timestamps
    end

    create_table :preworks do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :exercise, index: true
      t.integer    :state, default: 0, limit: 1

      t.timestamps
    end

    add_foreign_key :preworks, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :preworks, :courses, column: :course_id, on_delete: :cascade
    add_foreign_key :preworks, :exercises, column: :exercise_id, on_delete: :cascade

    add_index :preworks, [:user_id, :course_id, :exercise_id], unique: true
  end
end
