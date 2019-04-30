class Profile < ApplicationRecord

  has_one_attached :pic

  # def avatar
  #   self.pic.variant(resize: "150x150!".processed) #processed.service_url
  # end
end
