class Reputation < ActiveRecord::Base
  attr_accessible :vote_down, :vote_up
  belongs_to :review
  validates :review, presence: true

end
