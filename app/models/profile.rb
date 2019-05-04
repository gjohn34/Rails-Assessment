class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :likes
  after_commit :add_default_profile_pic, on: [:create, :update]

  has_one_attached :pic
  has_many_attached :photos
  has_many :messages

  def avatar
    self.pic.variant(resize: "150x150!").processed.service_url #processed.service_url
  end

  private
  def add_default_profile_pic
    unless pic.attached?
      self.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
    end
  end
end
