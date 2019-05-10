class Message < ApplicationRecord
  belongs_to :profile
  validates :profile_id, :sender_id, :content, presence: true

  def find_sender
    return Profile.find(self.sender_id).name
  end
end
