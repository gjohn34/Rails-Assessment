class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  #validation
  validates :name, presence: true
  validates :user_id, uniqueness: true
  after_commit :add_default_profile_pic, on: [:create, :update]

  #has_many_and_belongs_to_many
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :likes
  has_many :messages

  #belongs_to
  belongs_to :user

  #active storage
  has_one_attached :pic
  has_many_attached :photos



  def avatar
    self.pic.variant(resize: "150x150!").processed#.service_url #processed.service_url
  end

  def avatar_small
    self.pic.variant(resize: "50x50!").processed#.service_url #processed.service_url
  end

  private
  #adds a default profile picture to a profile if none is provided
  def add_default_profile_pic
    unless pic.attached?
      self.pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "anon.png")), filename: 'anon.png', content_type: "image/png")
    end
  end
end
