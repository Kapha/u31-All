class Review < ActiveRecord::Base
  attr_accessible :book_id, :text, :user_id, :rating
  belongs_to :user
  belongs_to :book

end
