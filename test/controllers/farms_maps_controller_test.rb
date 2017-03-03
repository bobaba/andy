require 'test_helper'

class FarmsMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farms_map = farms_maps(:one)
  end

  test "should get index" do
    get farms_maps_url
    assert_response :success
  end

  test "should get new" do
    get new_farms_map_url
    assert_response :success
  end

  test "should create farms_map" do
    assert_difference('FarmsMap.count') do
      post farms_maps_url, params: { farms_map: { address: @farms_map.address, description: @farms_map.description, latitude: @farms_map.latitude, longitude: @farms_map.longitude, name: @farms_map.name } }
    end

    assert_redirected_to farms_map_url(FarmsMap.last)
  end

  test "should show farms_map" do
    get farms_map_url(@farms_map)
    assert_response :success
  end

  test "should get edit" do
    get edit_farms_map_url(@farms_map)
    assert_response :success
  end

  test "should update farms_map" do
    patch farms_map_url(@farms_map), params: { farms_map: { address: @farms_map.address, description: @farms_map.description, latitude: @farms_map.latitude, longitude: @farms_map.longitude, name: @farms_map.name } }
    assert_redirected_to farms_map_url(@farms_map)
  end

  test "should destroy farms_map" do
    assert_difference('FarmsMap.count', -1) do
      delete farms_map_url(@farms_map)
    end

    assert_redirected_to farms_maps_url
  end
end
