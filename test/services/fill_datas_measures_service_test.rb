require 'test_helper'

class FillDatasMeasuresServiceTest < ActionDispatch::SystemTestCase
  setup do
    @measure_types = {
      'TMP' => {
        'Room 8A' => [],
        'Room B2' => [],
        'Room 8F' => []
      },
      'VOCT' => {
        'Room 8A' => [],
        'Room B2' => [],
        'Room 8F' => []
      },
      'HUM' => {
        'Room 8A' => [],
        'Room B2' => [],
        'Room 8F' => []
      },
      'CO2' => {
        'Room 8A' => [],
        'Room B2' => [],
        'Room 8F' => []
      }
    }

    @rooms = ['Room 8A', 'Room 8F', 'Room B2']

    @measures = [Measure.create(category: 'CO2', room: 'Room 8A', value: 460, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'HUM', room: 'Room 8A', value: 30, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'VOCT', room: 'Room 8A', value: 120, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'TMP', room: 'Room 8A', value: 19, measured_at: '2021-11-01T23:59:36Z'),

                 Measure.create(category: 'CO2', room: 'Room 8F', value: 455, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'HUM', room: 'Room 8F', value: 60, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'VOCT', room: 'Room 8F', value: 100, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'TMP', room: 'Room 8F', value: 21, measured_at: '2021-11-01T23:59:36Z'),

                 Measure.create(category: 'CO2', room: 'Room B2', value: 445, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'HUM', room: 'Room B2', value: 50, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'VOCT', room: 'Room B2', value: 110, measured_at: '2021-11-01T23:59:36Z'),
                 Measure.create(category: 'TMP', room: 'Room B2', value: 24, measured_at: '2021-11-01T23:59:36Z')]
  end

  test 'should fill room with measures for each parameters' do
    result = FillDatasMeasuresService.new(@measure_types, @rooms, @measures).call

    assert_equal 460, result['CO2']['Room 8A'][0]
    assert_equal 30, result['HUM']['Room 8A'][0]
    assert_equal 120, result['VOCT']['Room 8A'][0]
    assert_equal 19, result['TMP']['Room 8A'][0]

    assert_equal 455, result['CO2']['Room 8F'][1]
    assert_equal 60, result['HUM']['Room 8F'][1]
    assert_equal 100, result['VOCT']['Room 8F'][1]
    assert_equal 21, result['TMP']['Room 8F'][1]

    assert_equal 445, result['CO2']['Room B2'][2]
    assert_equal 50, result['HUM']['Room B2'][2]
    assert_equal 110, result['VOCT']['Room B2'][2]
    assert_equal 24, result['TMP']['Room B2'][2]
  end
end
