require 'test_helper'

class CupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cup = cups(:one)
  end

  test "should get index" do
    get cups_url, as: :json
    assert_response :success
  end

  test "should create cup" do
    assert_difference('Cup.count') do
      post cups_url, params: { cup: { title: @cup.title } }, as: :json
    end

    assert_response 201
  end

  test "should show cup" do
    get cup_url(@cup), as: :json
    assert_response :success
  end

  test "should update cup" do
    patch cup_url(@cup), params: { cup: { title: @cup.title } }, as: :json
    assert_response 200
  end

  test "should destroy cup" do
    assert_difference('Cup.count', -1) do
      delete cup_url(@cup), as: :json
    end

    assert_response 204
  end
end
