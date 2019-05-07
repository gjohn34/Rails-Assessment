require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  user = User.create!(email: "email@test.com", password: "password")

  test 'profile should not save without a name' do
    profile = Profile.new(user_id: user.id)
    assert_not profile.save, "profile saved without a name"
  end

  test 'profile should save a default profile pic' do
    profile = Profile.new(user_id: user.id)
    profile.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
    assert profile.pic.attached?
  end

  test 'profile should begin not premium' do
    profile = Profile.new()
    assert profile.premium == false, 'profile begins as premium'
  end


end
