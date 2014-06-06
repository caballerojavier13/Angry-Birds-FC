require 'test_helper'

class FunctionsControllerTest < ActionController::TestCase
  setup do
    @function = functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create function" do
    assert_difference('Functions.count') do
      post :create, function: { name: @function.name }
    end

    assert_redirected_to function_path(assigns(:function))
  end

  test "should show function" do
    get :show, id: @function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @function
    assert_response :success
  end

  test "should update function" do
    put :update, id: @function, function: { name: @function.name }
    assert_redirected_to function_path(assigns(:function))
  end

  test "should destroy function" do
    assert_difference('Functions.count', -1) do
      delete :destroy, id: @function
    end

    assert_redirected_to functions_index_path
  end
end
