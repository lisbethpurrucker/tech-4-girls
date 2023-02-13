class CreateUserQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :status
      t.float :progress

      t.timestamps
    end
  end
end
