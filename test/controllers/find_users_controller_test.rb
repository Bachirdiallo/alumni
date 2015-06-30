require 'test_helper'

class FindUsersControllerTest < ActionController::TestCase
  setup do
    @find_user = find_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:find_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create find_user" do
    assert_difference('FindUser.count') do
      post :create, find_user: {  }
    end

    assert_redirected_to find_user_path(assigns(:find_user))
  end

  test "should show find_user" do
    get :show, id: @find_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @find_user
    assert_response :success
  end

  test "should update find_user" do
    patch :update, id: @find_user, find_user: {  }
    assert_redirected_to find_user_path(assigns(:find_user))
  end

  test "should destroy find_user" do
    assert_difference('FindUser.count', -1) do
      delete :destroy, id: @find_user
    end

    assert_redirected_to find_users_path
  end
end
