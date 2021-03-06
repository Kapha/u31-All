class Question < ActiveRecord::Base
  attr_accessible :quest, :topic_id, :subject 

  belongs_to :user
  belongs_to :topic
  has_many :answers, dependent: :destroy
  has_many :qvotes, dependent: :destroy
  has_many :voters, through: :qvotes, source: :user

  validates :user_id, presence: true
  validates :topic_id, presence: true
end
