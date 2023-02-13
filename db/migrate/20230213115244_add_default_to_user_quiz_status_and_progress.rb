class AddDefaultToUserQuizStatusAndProgress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_quizzes, :status, from: nil, to: 0
    change_column_default :user_quizzes, :progress, from: nil, to: 0.0
  end
end
