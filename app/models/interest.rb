class Interest < ApplicationRecord
  has_and_belongs_to_many :profiles

  validates :interest, presence: true
end
