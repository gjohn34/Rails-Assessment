require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @profile = Profile.new()
  end

  test 'profile should not save without a name' do
    assert_not @profile.save, "profile saved without a name"
  end

  test 'profile should save a default profile pic' do
    @profile.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
    assert @profile.pic.attached?
  end

  test 'profile should begin not premium' do
    assert @profile.premium == false, 'profile begins as premium'
  end

  test 'number of likes' do
    assert_equal 0, @profile.likes.size, 'profile should start empty'
  end


end
