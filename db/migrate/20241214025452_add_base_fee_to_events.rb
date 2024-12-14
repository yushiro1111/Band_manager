class AddBaseFeeToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :base_fee, :integer
  end
end
