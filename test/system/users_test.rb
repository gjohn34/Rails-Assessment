require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "should get home" do
   get about_url
   assert_response :success
  end
end
