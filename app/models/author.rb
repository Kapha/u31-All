class Author < ActiveRecord::Base
  attr_accessible :a1stname, :asurname
  has_many :books
  has_many :reviews, :through => :books

  default_scope order: 'authors.asurname ASC'

  validates :a1stname, presence: true
  validates :asurname, presence: true

  def afull_name
    "#{asurname}, #{a1stname}"
  end
end
