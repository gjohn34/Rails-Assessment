require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "Users"
  # end

  test "should login successfully" do
    puts 'hello'
    click_on "Log In"
    puts 'hello'
    fill_in "email", with: "test4@test.com"
    fill_in "password", with: "password"

    click_on "Log in"
    assert_text "Create Profile"
  end
end
