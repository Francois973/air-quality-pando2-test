class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.string :room
      t.string :category
      t.float :value
      t.datetime :measured_at

      t.timestamps
    end
  end
end
