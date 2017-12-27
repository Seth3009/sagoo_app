require 'test_helper'

class PositionGroupsControllerTest < ActionController::TestCase
  setup do
    @position_group = position_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_group" do
    assert_difference('PositionGroup.count') do
      post :create, position_group: { group_id: @position_group.group_id, name: @position_group.name, note: @position_group.note }
    end

    assert_redirected_to position_group_path(assigns(:position_group))
  end

  test "should show position_group" do
    get :show, id: @position_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_group
    assert_response :success
  end

  test "should update position_group" do
    patch :update, id: @position_group, position_group: { group_id: @position_group.group_id, name: @position_group.name, note: @position_group.note }
    assert_redirected_to position_group_path(assigns(:position_group))
  end

  test "should destroy position_group" do
    assert_difference('PositionGroup.count', -1) do
      delete :destroy, id: @position_group
    end

    assert_redirected_to position_groups_path
  end
end
