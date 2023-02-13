class PagesController < ApplicationController
  def home
    measures = Measure.order(measured_at: :asc)
    rooms = measures.pluck(:room).uniq

    measure_types = format_datas(measures, rooms)

    @datas = fill_datas_measures(measure_types, rooms, measures)
  end

  private

  def fill_datas_measures(measure_types, rooms, measures)
    measures.each_with_object(measure_types) do |measure_db, acc|
      currency_measure = acc[measure_db.category]

      currency_measure['labels'] = [] unless currency_measure['labels']
      currency_measure['labels'] << measure_db.measured_at
      ap rooms
      rooms.each do |room|
        currency_measure[room] << measure_db.value if measure_db.room == room
        currency_measure[room] << nil unless measure_db.room == room
      end

      acc[measure_db.category] = currency_measure
      acc
    end
  end

  def format_datas(measures, rooms)
    measures.pluck(:category).uniq.each_with_object({}) do |measure_type, acc|
      acc[measure_type] = rooms.each_with_object({}) { |room, acc2| acc2[room] = [] }
    end
  end
end
