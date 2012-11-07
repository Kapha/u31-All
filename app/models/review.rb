class Review < ActiveRecord::Base
  attr_accessible :book_id, :text, :user_id, :rating
  belongs_to :user
  belongs_to :book
  has_many :reputations

  validates :book_id, presence: true
  validates :rating, presence: true
  validates :text, presence: true

  def rate_word
      puts "Absolutley Horrible"
  end 
end
