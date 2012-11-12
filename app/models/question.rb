class Question < ActiveRecord::Base
  attr_accessible :quest, :topic

  belongs_to :user
  belongs_to :topic
end
