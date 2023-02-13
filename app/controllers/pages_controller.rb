class PagesController < ApplicationController
  def home
    rooms_params = params[:rooms].split(',') if params[:rooms].present?
    measures_params = params[:measures].split(',') if params[:measures].present?

    measures = Measure.order(measured_at: :asc)
    ap measures
    measures = measures.where(room: rooms_params) if rooms_params
    measures = measures.where(category: measures_params) if measures_params

    rooms = measures.pluck(:room).uniq

    measure_types = FormatDatasService.new(measures, rooms).call
    @datas = FillDatasMeasuresService.new(measure_types, rooms, measures).call
  end
end
