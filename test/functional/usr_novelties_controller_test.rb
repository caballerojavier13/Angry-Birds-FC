require 'test_helper'

class UsrNoveltiesControllerTest < ActionController::TestCase
  setup do
    @usr_novelty = usr_novelties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usr_novelties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usr_novelty" do
    assert_difference('UsrNovelty.count') do
      post :create, usr_novelty: {  }
    end

    assert_redirected_to usr_novelty_path(assigns(:usr_novelty))
  end

  test "should show usr_novelty" do
    get :show, id: @usr_novelty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usr_novelty
    assert_response :success
  end

  test "should update usr_novelty" do
    put :update, id: @usr_novelty, usr_novelty: {  }
    assert_redirected_to usr_novelty_path(assigns(:usr_novelty))
  end

  test "should destroy usr_novelty" do
    assert_difference('UsrNovelty.count', -1) do
      delete :destroy, id: @usr_novelty
    end

    assert_redirected_to usr_novelties_path
  end
end
