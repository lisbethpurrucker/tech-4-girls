class RemoveLanguageFromQuizzes < ActiveRecord::Migration[7.0]
  def change
    remove_column :quizzes, :language_id
  end
end
