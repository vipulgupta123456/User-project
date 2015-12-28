require 'test_helper'

class PhoneNumberControllerTest < ActionController::TestCase
  test "should get phone_number:integer" do
    get :phone_number:integer
    assert_response :success
  end

end
