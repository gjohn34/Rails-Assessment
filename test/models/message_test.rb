require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'message should not save without content' do
    message = Message.new
    assert_not message.save, 'message saved without message content'
  end

  test 'message should belong to a user' do
    message = Message.new
    assert_not message.save, 'message saved without a user'
  end
end
