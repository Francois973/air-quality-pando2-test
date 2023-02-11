class PagesController < ApplicationController
  def home
    @room_8a = Measure.where(room_id: Room.find_by(name: 'Room8a').id)
    @room_8f = Measure.where(room_id: Room.find_by(name: 'Room8f').id)
    @room_b2 = Measure.where(room_id: Room.find_by(name: 'Roomb2').id)
    # ap @room_8a
    # @rooms = Room.includes(:measures)
  end
end
