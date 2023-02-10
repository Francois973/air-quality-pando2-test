class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.references :room, null: false, foreign_key: true
      t.integer :co2
      t.integer :hum
      t.integer :tmp
      t.integer :voct
      t.datetime :timestamp

      t.timestamps
    end
  end
end
