class RemoveLanguages < ActiveRecord::Migration[7.0]
  def change
    drop_table :languages
  end
end
