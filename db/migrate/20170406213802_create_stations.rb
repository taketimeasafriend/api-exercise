class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :sta_name
      t.string :sta_enname
      t.string :sta_code

      t.timestamps
    end
    add_index :stations, :sta_name
  end
end
