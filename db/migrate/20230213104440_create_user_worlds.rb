class CreateUserWorlds < ActiveRecord::Migration[7.0]
  def change
    create_table :user_worlds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :world, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
