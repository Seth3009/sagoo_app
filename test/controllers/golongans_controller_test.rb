require 'test_helper'

class GolongansControllerTest < ActionController::TestCase
  setup do
    @golongan = golongans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:golongans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create golongan" do
    assert_difference('Golongan.count') do
      post :create, golongan: { gaji: @golongan.gaji, nama: @golongan.nama, note: @golongan.note }
    end

    assert_redirected_to golongan_path(assigns(:golongan))
  end

  test "should show golongan" do
    get :show, id: @golongan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @golongan
    assert_response :success
  end

  test "should update golongan" do
    patch :update, id: @golongan, golongan: { gaji: @golongan.gaji, nama: @golongan.nama, note: @golongan.note }
    assert_redirected_to golongan_path(assigns(:golongan))
  end

  test "should destroy golongan" do
    assert_difference('Golongan.count', -1) do
      delete :destroy, id: @golongan
    end

    assert_redirected_to golongans_path
  end
end
