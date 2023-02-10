require 'csv'
require 'date'

Measure.destroy_all
Room.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'room_8a.csv'))
csv = CSV.parse(csv_text, headers: true)

@room_8a = Room.create(name: 'Room8a')

csv.each do |measure|
  m = Measure.new
  m.co2 =  measure['measure_float'] if measure['measure_type'] == 'CO2'
  m.hum =  measure['measure_float'] if measure['measure_type'] == 'HUM'
  m.tmp =  measure['measure_float'] if measure['measure_type'] == 'TMP'
  m.voct = measure['measure_float'] if measure['measure_type'] == 'VOCT'
  m.timestamp = measure['@timestamp']
  m.room_id = @room_8a.id
  m.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'room_8f.csv'))
csv = CSV.parse(csv_text, headers: true)

@room_8f = Room.create(name: 'Room8f')

csv.each do |measure|
  m = Measure.new
  m.co2 =  measure['measure_float'] if measure['measure_type'] == 'CO2'
  m.hum =  measure['measure_float'] if measure['measure_type'] == 'HUM'
  m.tmp =  measure['measure_float'] if measure['measure_type'] == 'TMP'
  m.voct = measure['measure_float'] if measure['measure_type'] == 'VOCT'
  m.timestamp = measure['@timestamp']
  m.room_id = @room_8f.id
  m.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'room_8f.csv'))
csv = CSV.parse(csv_text, headers: true)

@room_b2 = Room.create(name: 'Roomb2')

csv.each do |measure|
  m = Measure.new
  m.co2 =  measure['measure_float'] if measure['measure_type'] == 'CO2'
  m.hum =  measure['measure_float'] if measure['measure_type'] == 'HUM'
  m.tmp =  measure['measure_float'] if measure['measure_type'] == 'TMP'
  m.voct = measure['measure_float'] if measure['measure_type'] == 'VOCT'
  m.timestamp = measure['@timestamp']
  m.room_id = @room_b2.id
  m.save
end
