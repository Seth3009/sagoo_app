require 'test_helper'

class PotonganEmployeesControllerTest < ActionController::TestCase
  setup do
    @potongan_employee = potongan_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potongan_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potongan_employee" do
    assert_difference('PotonganEmployee.count') do
      post :create, potongan_employee: { amount: @potongan_employee.amount, employee_id: @potongan_employee.employee_id, kasbon_id: @potongan_employee.kasbon_id, pot_month: @potongan_employee.pot_month, potongan_id: @potongan_employee.potongan_id }
    end

    assert_redirected_to potongan_employee_path(assigns(:potongan_employee))
  end

  test "should show potongan_employee" do
    get :show, id: @potongan_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potongan_employee
    assert_response :success
  end

  test "should update potongan_employee" do
    patch :update, id: @potongan_employee, potongan_employee: { amount: @potongan_employee.amount, employee_id: @potongan_employee.employee_id, kasbon_id: @potongan_employee.kasbon_id, pot_month: @potongan_employee.pot_month, potongan_id: @potongan_employee.potongan_id }
    assert_redirected_to potongan_employee_path(assigns(:potongan_employee))
  end

  test "should destroy potongan_employee" do
    assert_difference('PotonganEmployee.count', -1) do
      delete :destroy, id: @potongan_employee
    end

    assert_redirected_to potongan_employees_path
  end
end
