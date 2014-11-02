require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get landing" do
    get :landing
    assert_response :success
    assert_select "title", "Landing | Clickety Ticket"
  end

 # test "should get home" do
#    get :home
 #   assert_response :success
  #  assert_select "title", "Home | Clickety Ticket"
#  end

end
