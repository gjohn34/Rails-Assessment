require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new
  end

  test 'like should not be null' do
    assert_not @like.save, 'like saved'
  end
end
