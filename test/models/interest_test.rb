require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  test "interest shouldn't be created without a name" do
    interest = Interest.new
    assert_not interest.save
  end
end
