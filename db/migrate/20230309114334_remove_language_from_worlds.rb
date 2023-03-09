class RemoveLanguageFromWorlds < ActiveRecord::Migration[7.0]
  def change
    remove_column :worlds, :language, :string
  end
end
