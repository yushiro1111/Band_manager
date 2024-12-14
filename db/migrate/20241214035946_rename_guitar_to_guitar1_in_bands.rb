class RenameGuitarToGuitar1InBands < ActiveRecord::Migration[7.0]
  def change
    rename_column :bands, :guitar, :guitar1
  end
end
