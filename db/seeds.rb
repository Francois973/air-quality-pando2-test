require 'csv'

Measure.destroy_all
Room.destroy_all

room_8a = Room.create(name: 'Room8a')
room_8f = Room.create(name: 'Room8f')
room_b2 = Room.create(name: 'Roomb2')

def insert_datas_database(file, room)
  csv_text = File.read(Rails.root.join('lib', 'seeds', file))
  csv = CSV.parse(csv_text, headers: true)

  measure_params = {
    co2: nil,
    hum: nil,
    tmp: nil,
    voct: nil,
    timestamp: nil,
    room_id: nil
  }

  csv.each do |measure|
    measure_params[:co2] = measure['measure_float'] if measure['measure_type'] == 'CO2'
    measure_params[:hum] = measure['measure_float'] if measure['measure_type'] == 'HUM'
    measure_params[:tmp] = measure['measure_float'] if measure['measure_type'] == 'TMP'
    measure_params[:voct] = measure['measure_float'] if measure['measure_type'] == 'VOCT'
    measure_params[:timestamp] = measure['@timestamp']
    measure_params[:room_id] = room.id

    if measure = Measure.find_by(timestamp: measure['@timestamp'])
      measure.update(measure_params)
    else
      Measure.create(measure_params)
    end
  end
end

insert_datas_database('room_8a.csv', room_8a)
insert_datas_database('room_8f.csv', room_8f)
insert_datas_database('room_b2.csv', room_b2)
