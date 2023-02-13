class CreateUserLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.integer :status
      t.float :progress

      t.timestamps
    end
  end
end
