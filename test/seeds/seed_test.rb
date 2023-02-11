require 'test_helper'

class SeedTest < ActiveSupport::TestCase
  setup do
    Measure.destroy_all
    Room.destroy_all

    load Rails.root.join('db/seeds.rb')
  end

  test 'room should be create 3 times' do
    assert_equal Room.count, 3
  end

  test 'room should be create' do
    room_8a = Room.find_by(name: 'Room8a')
    room_8f = Room.find_by(name: 'Room8f')
    room_b2 = Room.find_by(name: 'Roomb2')

    assert_not_nil room_8a, 'Room 8a should have been created'
    assert_not_nil room_8f, 'Room 8f should have been created'
    assert_not_nil room_b2, 'Room b2 should have been created'
  end

  test 'room should have more than one measure' do
    room_8a = Room.find_by(name: 'Room8a')
    room_8f = Room.find_by(name: 'Room8f')
    room_b2 = Room.find_by(name: 'Roomb2')

    assert_equal true, room_8a.measures.count > 1
    assert_equal true, room_8f.measures.count > 1
    assert_equal true, room_b2.measures.count > 1
  end

  test 'room should have 4 measures with de same timestamp' do
    room_8a = Room.find_by(name: 'Room8a')

    timestamp = DateTime.parse('2021-11-01T23:54:23Z')
    assert_equal 1, room_8a.measures.where('timestamp = ?', timestamp).count
    assert_equal 384, room_8a.measures.where('timestamp = ?', timestamp).map(&:co2).join.to_i
    assert_equal 55, room_8a.measures.where('timestamp = ?', timestamp).map(&:hum).join.to_i
    assert_equal 17, room_8a.measures.where('timestamp = ?', timestamp).map(&:tmp).join.to_i
    assert_equal 103, room_8a.measures.where('timestamp = ?', timestamp).map(&:voct).join.to_i
  end
end
