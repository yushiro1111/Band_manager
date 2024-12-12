class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:users, :role) # role カラムが存在する場合は追加しない
      add_column :users, :role, :integer, default: 0, null: false
    end
  end
end
