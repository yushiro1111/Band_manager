class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      # t.string :email,              null: false, default: "" # 既存の email カラムと重複するためコメントアウト
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      # 他の Devise カラムはそのまま追加
    end

    # t.index :email, unique: true # email インデックスも不要
    add_index :users, :reset_password_token, unique: true
  end
end
