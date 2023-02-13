class FormatDatasService
  def initialize(measures, rooms)
    @measures = measures
    @rooms = rooms
  end

  def call
    @measures.pluck(:category).uniq.each_with_object({}) do |measure_type, acc|
      acc[measure_type] = @rooms.each_with_object({}) { |room, acc2| acc2[room] = [] }
    end
  end
end
