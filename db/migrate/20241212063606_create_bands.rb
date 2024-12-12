class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :leader_id, null: false
      t.string :vocal
      t.string :guitar
      t.string :guitar2
      t.string :bass
      t.string :drum
      t.text :notes

      t.timestamps
    end

    add_foreign_key :bands, :users, column: :leader_id
  end
end
