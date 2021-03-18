class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image
  mount_uploader :video, VideoUploader

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
