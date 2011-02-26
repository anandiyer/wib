require 'test_helper'

class SportTypesControllerTest < ActionController::TestCase
  setup do
    @sport_type = sport_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sport_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sport_type" do
    assert_difference('SportType.count') do
      post :create, :sport_type => @sport_type.attributes
    end

    assert_redirected_to sport_type_path(assigns(:sport_type))
  end

  test "should show sport_type" do
    get :show, :id => @sport_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sport_type.to_param
    assert_response :success
  end

  test "should update sport_type" do
    put :update, :id => @sport_type.to_param, :sport_type => @sport_type.attributes
    assert_redirected_to sport_type_path(assigns(:sport_type))
  end

  test "should destroy sport_type" do
    assert_difference('SportType.count', -1) do
      delete :destroy, :id => @sport_type.to_param
    end

    assert_redirected_to sport_types_path
  end
end
