require 'test_helper'

class DetailKasbonsControllerTest < ActionController::TestCase
  setup do
    @detail_kasbon = detail_kasbons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_kasbons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_kasbon" do
    assert_difference('DetailKasbon.count') do
      post :create, detail_kasbon: { jumlah_bayar: @detail_kasbon.jumlah_bayar, sisa: @detail_kasbon.sisa, tanggal_bayar: @detail_kasbon.tanggal_bayar }
    end

    assert_redirected_to detail_kasbon_path(assigns(:detail_kasbon))
  end

  test "should show detail_kasbon" do
    get :show, id: @detail_kasbon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_kasbon
    assert_response :success
  end

  test "should update detail_kasbon" do
    patch :update, id: @detail_kasbon, detail_kasbon: { jumlah_bayar: @detail_kasbon.jumlah_bayar, sisa: @detail_kasbon.sisa, tanggal_bayar: @detail_kasbon.tanggal_bayar }
    assert_redirected_to detail_kasbon_path(assigns(:detail_kasbon))
  end

  test "should destroy detail_kasbon" do
    assert_difference('DetailKasbon.count', -1) do
      delete :destroy, id: @detail_kasbon
    end

    assert_redirected_to detail_kasbons_path
  end
end
