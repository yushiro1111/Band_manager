class ChangeRoleToBeIntegerInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role, :integer, using: "role::integer", default: 0, null: false
  end

  def down
    change_column :users, :role, :string
  end
end
