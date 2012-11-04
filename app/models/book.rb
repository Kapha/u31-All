class Book < ActiveRecord::Base
  attr_accessible :author_id, :description, :title
  belongs_to :author
  has_many :reviews

  default_scope order: 'books.title ASC'

  validates :author_id, presence: true
  validates :title, presence: true

end
