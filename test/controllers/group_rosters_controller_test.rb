require 'test_helper'

class GroupRostersControllerTest < ActionController::TestCase
  setup do
    @group_roster = group_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_roster" do
    assert_difference('GroupRoster.count') do
      post :create, group_roster: { amount: @group_roster.amount, group_id: @group_roster.group_id, roster_id: @group_roster.roster_id }
    end

    assert_redirected_to group_roster_path(assigns(:group_roster))
  end

  test "should show group_roster" do
    get :show, id: @group_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_roster
    assert_response :success
  end

  test "should update group_roster" do
    patch :update, id: @group_roster, group_roster: { amount: @group_roster.amount, group_id: @group_roster.group_id, roster_id: @group_roster.roster_id }
    assert_redirected_to group_roster_path(assigns(:group_roster))
  end

  test "should destroy group_roster" do
    assert_difference('GroupRoster.count', -1) do
      delete :destroy, id: @group_roster
    end

    assert_redirected_to group_rosters_path
  end
end
