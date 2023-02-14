class FillDatasMeasuresService
  def initialize(measure_types, rooms, measures)
    @measure_types = measure_types
    @rooms = rooms
    @measures = measures
  end

  def call
    @measures.each_with_object(@measure_types) do |measure_db, acc|
      currency_measure = acc[measure_db.category]

      currency_measure['labels'] = [] unless currency_measure['labels']
      currency_measure['labels'] << measure_db.measured_at

      @rooms.each do |room|
        currency_measure[room] << measure_db.value if measure_db.room == room
        currency_measure[room] << nil unless measure_db.room == room
      end

      acc[measure_db.category] = currency_measure
      acc
    end
  end
end
