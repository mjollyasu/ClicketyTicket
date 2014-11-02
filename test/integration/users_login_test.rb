require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:matt)
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {name: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with vaild information followed by logout" do
    get login_path
    post login_path, session: { name: @user.name, password: 'password'}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
  end
end
