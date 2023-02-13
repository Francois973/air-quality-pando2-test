require 'test_helper'

class SeedTest < ActiveSupport::TestCase
  setup do
    Measure.destroy_all

    load Rails.root.join('db/seeds.rb')
  end

  test 'should find measure from timestamp' do
    timestamp = DateTime.parse('2021-11-01T23:54:23Z')
    measures = Measure.where(measured_at: timestamp)

    assert_equal 384, measures[0].value
    assert_equal 'CO2', measures[0].category
    assert_equal 'Room 8A', measures[0].room
  end
end
