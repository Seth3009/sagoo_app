require 'test_helper'

class PotongansControllerTest < ActionController::TestCase
  setup do
    @potongan = potongans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potongans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potongan" do
    assert_difference('Potongan.count') do
      post :create, potongan: { nama: @potongan.nama }
    end

    assert_redirected_to potongan_path(assigns(:potongan))
  end

  test "should show potongan" do
    get :show, id: @potongan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potongan
    assert_response :success
  end

  test "should update potongan" do
    patch :update, id: @potongan, potongan: { nama: @potongan.nama }
    assert_redirected_to potongan_path(assigns(:potongan))
  end

  test "should destroy potongan" do
    assert_difference('Potongan.count', -1) do
      delete :destroy, id: @potongan
    end

    assert_redirected_to potongans_path
  end
end
