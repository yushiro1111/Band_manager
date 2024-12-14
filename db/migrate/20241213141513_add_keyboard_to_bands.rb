class AddKeyboardToBands < ActiveRecord::Migration[7.0]
  def change
    add_column :bands, :keyboard, :string
  end
end
