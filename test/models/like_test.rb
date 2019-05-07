require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'like should not be null' do
    like = Like.new
    assert_not like.save, 'like saved'
  end
end
