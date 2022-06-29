require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { advertisement_delivery: @user.advertisement_delivery, contact_from_manager: @user.contact_from_manager, email_magazine: @user.email_magazine, introduction_project_email: @user.introduction_project_email, name: @user.name, scout_email_notification: @user.scout_email_notification } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { advertisement_delivery: @user.advertisement_delivery, contact_from_manager: @user.contact_from_manager, email_magazine: @user.email_magazine, introduction_project_email: @user.introduction_project_email, name: @user.name, scout_email_notification: @user.scout_email_notification } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
