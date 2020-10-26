require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get say_hello" do
    get welcome_say_hello_url
    assert_response :success
  end

end
