class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.integer :role, default: 0, null: false # 0: member, 1: admin

      t.timestamps
    end
  end
end
