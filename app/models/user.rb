class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  has_one_attached :image

  has_many :lessons, dependent: :destroy
  has_many :categories, through: :lessons
  has_many :words, through: :lessons

  has_many :received_follows, foreign_key: :followed_id, class_name: "Ralationship"
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: "Ralationship"
  has_many :followings, through: :given_follows, source: :followed

  def follow(user)
    given_follows.create(followed_id: user.id)
  end

  def unfollow(user)
    given_follows.find_by(followed_id: user.id).destroy
  end

  def following(user)
    followings.include?(user)
  end
end
