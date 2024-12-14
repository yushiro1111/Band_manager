class AddEventIdToBands < ActiveRecord::Migration[6.1]
  def change
    # 1. カラムを nullable として追加
    add_column :bands, :event_id, :integer

    # 2. 既存レコードにデフォルト値を設定
    default_event = Event.first || Event.create!(name: "Default Event", date: Time.now, location: "Default Location")
    Band.update_all(event_id: default_event.id)

    # 3. NOT NULL 制約を適用
    change_column_null :bands, :event_id, false

    # 4. 外部キー制約を追加
    add_foreign_key :bands, :events
  end
end
