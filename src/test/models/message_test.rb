require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = Message.new()
  end

  test 'message should not save without content' do
    @message[:profile_id] = 1
    @message[:sender_id] = 2
    assert_not @message.save, 'message saved without message content'
  end

  test 'message should have a recipient ID' do
    @message[:content] = 'string'
    @message[:sender_id] = 2
    assert_not @message.save, 'message saved without a recipient'
  end

  test 'message should not save without a sender ID' do
    @message[:profile_id] = 2
    @message[:content] = 'as'
    assert_not @message.save, 'message saved without a sender'
  end
end
