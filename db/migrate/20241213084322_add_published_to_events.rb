class AddPublishedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :published, :boolean, default: false, null: false
  end
end
