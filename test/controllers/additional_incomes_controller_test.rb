require 'test_helper'

class AdditionalIncomesControllerTest < ActionController::TestCase
  setup do
    @additional_income = additional_incomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additional_incomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additional_income" do
    assert_difference('AdditionalIncome.count') do
      post :create, additional_income: { add_month: @additional_income.add_month, amount: @additional_income.amount, employee_id: @additional_income.employee_id, name: @additional_income.name }
    end

    assert_redirected_to additional_income_path(assigns(:additional_income))
  end

  test "should show additional_income" do
    get :show, id: @additional_income
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @additional_income
    assert_response :success
  end

  test "should update additional_income" do
    patch :update, id: @additional_income, additional_income: { add_month: @additional_income.add_month, amount: @additional_income.amount, employee_id: @additional_income.employee_id, name: @additional_income.name }
    assert_redirected_to additional_income_path(assigns(:additional_income))
  end

  test "should destroy additional_income" do
    assert_difference('AdditionalIncome.count', -1) do
      delete :destroy, id: @additional_income
    end

    assert_redirected_to additional_incomes_path
  end
end
