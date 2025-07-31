class CreateUserVideoProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_video_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :video_id
      t.boolean :completed

      t.timestamps
    end
  end
end
