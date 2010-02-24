class Category < ActiveRecord::Base
  has_many :term_classifications
  has_many :terms, :through => :term_classifications
end