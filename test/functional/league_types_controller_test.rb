require 'test_helper'

class LeagueTypesControllerTest < ActionController::TestCase
  setup do
    @league_type = league_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:league_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league_type" do
    assert_difference('LeagueType.count') do
      post :create, :league_type => @league_type.attributes
    end

    assert_redirected_to league_type_path(assigns(:league_type))
  end

  test "should show league_type" do
    get :show, :id => @league_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @league_type.to_param
    assert_response :success
  end

  test "should update league_type" do
    put :update, :id => @league_type.to_param, :league_type => @league_type.attributes
    assert_redirected_to league_type_path(assigns(:league_type))
  end

  test "should destroy league_type" do
    assert_difference('LeagueType.count', -1) do
      delete :destroy, :id => @league_type.to_param
    end

    assert_redirected_to league_types_path
  end
end
