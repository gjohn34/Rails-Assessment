class Like < ApplicationRecord
  has_and_belongs_to_many :profiles

  validates :profile_id, presence:  true
end
