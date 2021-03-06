class Review < ActiveRecord::Base
  attr_accessible :book_id, :text, :user_id, :rating
  belongs_to :user
  belongs_to :book
  has_many :reputations
  has_many :followed_users, through: :relationships, source: :followed

  validates :book_id, presence: true
  validates :rating, presence: true
  validates :text, presence: true

  default_scope order: 'reviews.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
