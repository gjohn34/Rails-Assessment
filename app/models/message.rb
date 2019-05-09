class Message < ApplicationRecord
  belongs_to :profile

  def find_sender
    return Profile.find(self.sender_id).name
  end
end
