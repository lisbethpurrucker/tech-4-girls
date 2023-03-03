class RemoveLanguageFromLessons < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :language_id
  end
end
