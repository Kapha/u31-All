class Book < ActiveRecord::Base
  attr_accessible :author_id, :description, :title
  belongs_to :author
  has_many :reviews

  validates :author_id, presence: true

end
