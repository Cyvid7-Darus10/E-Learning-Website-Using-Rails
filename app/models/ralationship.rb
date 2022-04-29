class Ralationship < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"
  belongs_to :followed, foreign_key: :followed_id, class_name: "User"
  has_one    :activity, as: :action, dependent: :destroy

  after_create :initialize_activity

  def initialize_activity
    create_activity(user_id: follower_id)
  end
end