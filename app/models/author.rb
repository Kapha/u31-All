class Author < ActiveRecord::Base
  attr_accessible :a1stname, :asurname
  has_many :books
  has_many :reviews, :through => :books
  def afull_name
    "#{asurname}, #{a1stname}"
  end
end
