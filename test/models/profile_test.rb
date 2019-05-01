require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'profile should not save without a name' do
    profile = Profile.new
    assert_not profile.save, "profile saved without a name"
  end

  test 'profile should not save without a profile pic' do
    profile = Profile.new(name: "john smith")
    assert_not profile.save, "profile saved without a picture"
  end
end
