require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_url
    assert_response :success
  end

  test 'should get home with parameters' do
    get root_url, params: { rooms: 'Room 8A', measures: 'CO2' }

    assert_response :success
  end
end
