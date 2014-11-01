require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { 
        name: "test@example.com", password: "test123",
        password_confirmation: "test123" }
      end
    assert_template 'users/show'
  end

  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
        password: "123",
        password_confirmation: "456" }
      end
      assert_template 'users/new'
  end
end
