class Answer < ActiveRecord::Base
  attr_accessible :text, :user_id, :question_id

  belongs_to :user
  belongs_to :question
  has_many :comments

end
