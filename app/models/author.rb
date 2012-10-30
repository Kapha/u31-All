class Author < ActiveRecord::Base
  attr_accessible :a1stname, :asurname
  has_many :books
end
