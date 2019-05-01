class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :pic

  def avatar
    self.pic.variant(resize: "150x150!").processed.service_url #processed.service_url
  end



end
