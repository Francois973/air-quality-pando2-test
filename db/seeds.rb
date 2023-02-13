require 'csv'

Measure.destroy_all

['./room_8a.csv', './room_8f.csv', './room_b2.csv'].each do |file|
  CSV.foreach(file, headers: true) do |row|
    Measure.create(room: row['room_name'], category: row['measure_type'], value: row['measure_float'],
                   measured_at: row['@timestamp'])
  end
end
