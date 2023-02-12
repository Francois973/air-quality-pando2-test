class PagesController < ApplicationController
  def home
    @room_8a = Measure.where(room_id: Room.find_by(name: 'Room8a').id).sort_by(&:timestamp)
    @room_8f = Measure.where(room_id: Room.find_by(name: 'Room8f').id).sort_by(&:timestamp)
    @room_b2 = Measure.where(room_id: Room.find_by(name: 'Roomb2').id).sort_by(&:timestamp)
    # ap @room_8a
    # @rooms = Room.includes(:measures)
  end
end
