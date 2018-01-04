require 'test_helper'

class TakeHomesControllerTest < ActionController::TestCase
  setup do
    @take_home = take_homes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:take_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create take_home" do
    assert_difference('TakeHome.count') do
      post :create, take_home: { add_income: @take_home.add_income, employee_id: @take_home.employee_id, pay_month: @take_home.pay_month, sal_cut: @take_home.sal_cut, salary: @take_home.salary }
    end

    assert_redirected_to take_home_path(assigns(:take_home))
  end

  test "should show take_home" do
    get :show, id: @take_home
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @take_home
    assert_response :success
  end

  test "should update take_home" do
    patch :update, id: @take_home, take_home: { add_income: @take_home.add_income, employee_id: @take_home.employee_id, pay_month: @take_home.pay_month, sal_cut: @take_home.sal_cut, salary: @take_home.salary }
    assert_redirected_to take_home_path(assigns(:take_home))
  end

  test "should destroy take_home" do
    assert_difference('TakeHome.count', -1) do
      delete :destroy, id: @take_home
    end

    assert_redirected_to take_homes_path
  end
end
