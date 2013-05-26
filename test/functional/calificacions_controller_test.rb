require 'test_helper'

class CalificacionsControllerTest < ActionController::TestCase
  setup do
    @calificacion = calificacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calificacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calificacion" do
    assert_difference('Calificacion.count') do
      post :create, calificacion: { noticia_id: @calificacion.noticia_id, persona_id: @calificacion.persona_id, valor: @calificacion.valor }
    end

    assert_redirected_to calificacion_path(assigns(:calificacion))
  end

  test "should show calificacion" do
    get :show, id: @calificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calificacion
    assert_response :success
  end

  test "should update calificacion" do
    put :update, id: @calificacion, calificacion: { noticia_id: @calificacion.noticia_id, persona_id: @calificacion.persona_id, valor: @calificacion.valor }
    assert_redirected_to calificacion_path(assigns(:calificacion))
  end

  test "should destroy calificacion" do
    assert_difference('Calificacion.count', -1) do
      delete :destroy, id: @calificacion
    end

    assert_redirected_to calificacions_path
  end
end
