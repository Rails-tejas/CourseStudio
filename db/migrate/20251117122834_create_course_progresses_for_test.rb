class CreateCourseProgressesForTest < ActiveRecord::Migration[7.0]
  def change
    create_table :course_progresses do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
