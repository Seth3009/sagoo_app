require 'test_helper'

class KasbonsControllerTest < ActionController::TestCase
  setup do
    @kasbon = kasbons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kasbons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kasbon" do
    assert_difference('Kasbon.count') do
      post :create, kasbon: { jumlah_bayar: @kasbon.jumlah_bayar, jumlah_pinjam: @kasbon.jumlah_pinjam, nama: @kasbon.nama, sisa: @kasbon.sisa, tanggal_bayar: @kasbon.tanggal_bayar, tanggal_pinjam: @kasbon.tanggal_pinjam }
    end

    assert_redirected_to kasbon_path(assigns(:kasbon))
  end

  test "should show kasbon" do
    get :show, id: @kasbon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kasbon
    assert_response :success
  end

  test "should update kasbon" do
    patch :update, id: @kasbon, kasbon: { jumlah_bayar: @kasbon.jumlah_bayar, jumlah_pinjam: @kasbon.jumlah_pinjam, nama: @kasbon.nama, sisa: @kasbon.sisa, tanggal_bayar: @kasbon.tanggal_bayar, tanggal_pinjam: @kasbon.tanggal_pinjam }
    assert_redirected_to kasbon_path(assigns(:kasbon))
  end

  test "should destroy kasbon" do
    assert_difference('Kasbon.count', -1) do
      delete :destroy, id: @kasbon
    end

    assert_redirected_to kasbons_path
  end
end
