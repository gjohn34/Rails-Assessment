require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the about" do
    visit about_url

    assert_selector "h1", text: "Users"
  end
end
