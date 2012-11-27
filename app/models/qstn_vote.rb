class Qstnvote < ActiveRecord::Base
  attr_accessible :question_id, :user_id, :vote_cnt

  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true
end
