class AddDefaultToUserWorldActive < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_worlds, :active, from: nil, to: false
  end
end
