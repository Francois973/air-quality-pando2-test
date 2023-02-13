require 'test_helper'

class FormatDatasServiceTest < ActionDispatch::SystemTestCase
  test 'should format structure of datas' do
    measures = Measure.order(measured_at: :asc)
    rooms = ['Room 8A', 'Room B2', 'Room 8F']

    result = FormatDatasService.new(measures, rooms).call

    assert_equal [], result['MyString']['Room 8A']
    assert_equal [], result['MyString']['Room 8F']
    assert_equal [], result['MyString']['Room B2']

    assert_equal Hash, result.class
  end
end
