require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should login successfully" do
    visit profiles_path

    click_on "Log In"

    fill_in "email", with: "test4@test.com"
    fill_in "password", with: "password"

    click_on "Log in"
  end
  # test "the truth" do
  #   assert true
  # end
end
