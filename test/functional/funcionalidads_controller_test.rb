require 'test_helper'

class FuncionalidadsControllerTest < ActionController::TestCase
  setup do
    @funcionalidad = funcionalidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionalidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionalidad" do
    assert_difference('Funcionalidad.count') do
      post :create, funcionalidad: { descripcion: @funcionalidad.descripcion, nombre: @funcionalidad.nombre }
    end

    assert_redirected_to funcionalidad_path(assigns(:funcionalidad))
  end

  test "should show funcionalidad" do
    get :show, id: @funcionalidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionalidad
    assert_response :success
  end

  test "should update funcionalidad" do
    put :update, id: @funcionalidad, funcionalidad: { descripcion: @funcionalidad.descripcion, nombre: @funcionalidad.nombre }
    assert_redirected_to funcionalidad_path(assigns(:funcionalidad))
  end

  test "should destroy funcionalidad" do
    assert_difference('Funcionalidad.count', -1) do
      delete :destroy, id: @funcionalidad
    end

    assert_redirected_to funcionalidads_path
  end
end
