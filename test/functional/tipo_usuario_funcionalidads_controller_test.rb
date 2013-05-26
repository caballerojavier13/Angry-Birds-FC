require 'test_helper'

class TipoUsuarioFuncionalidadsControllerTest < ActionController::TestCase
  setup do
    @tipo_usuario_funcionalidad = tipo_usuario_funcionalidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_usuario_funcionalidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_usuario_funcionalidad" do
    assert_difference('TipoUsuarioFuncionalidad.count') do
      post :create, tipo_usuario_funcionalidad: { funcionalidad: @tipo_usuario_funcionalidad.funcionalidad, tipoUsuario_id: @tipo_usuario_funcionalidad.tipoUsuario_id }
    end

    assert_redirected_to tipo_usuario_funcionalidad_path(assigns(:tipo_usuario_funcionalidad))
  end

  test "should show tipo_usuario_funcionalidad" do
    get :show, id: @tipo_usuario_funcionalidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_usuario_funcionalidad
    assert_response :success
  end

  test "should update tipo_usuario_funcionalidad" do
    put :update, id: @tipo_usuario_funcionalidad, tipo_usuario_funcionalidad: { funcionalidad: @tipo_usuario_funcionalidad.funcionalidad, tipoUsuario_id: @tipo_usuario_funcionalidad.tipoUsuario_id }
    assert_redirected_to tipo_usuario_funcionalidad_path(assigns(:tipo_usuario_funcionalidad))
  end

  test "should destroy tipo_usuario_funcionalidad" do
    assert_difference('TipoUsuarioFuncionalidad.count', -1) do
      delete :destroy, id: @tipo_usuario_funcionalidad
    end

    assert_redirected_to tipo_usuario_funcionalidads_path
  end
end
