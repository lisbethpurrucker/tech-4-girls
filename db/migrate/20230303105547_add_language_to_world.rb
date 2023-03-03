class AddLanguageToWorld < ActiveRecord::Migration[7.0]
  def change
    add_column :worlds, :language, :string
  end
end
