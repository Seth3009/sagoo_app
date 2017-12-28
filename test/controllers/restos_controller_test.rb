require 'test_helper'

class RestosControllerTest < ActionController::TestCase
  setup do
    @resto = restos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resto" do
    assert_difference('Resto.count') do
      post :create, resto: { employee_id: @resto.employee_id, ended: @resto.ended, location_id: @resto.location_id, position_group_id: @resto.position_group_id, started: @resto.started }
    end

    assert_redirected_to resto_path(assigns(:resto))
  end

  test "should show resto" do
    get :show, id: @resto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resto
    assert_response :success
  end

  test "should update resto" do
    patch :update, id: @resto, resto: { employee_id: @resto.employee_id, ended: @resto.ended, location_id: @resto.location_id, position_group_id: @resto.position_group_id, started: @resto.started }
    assert_redirected_to resto_path(assigns(:resto))
  end

  test "should destroy resto" do
    assert_difference('Resto.count', -1) do
      delete :destroy, id: @resto
    end

    assert_redirected_to restos_path
  end
end
