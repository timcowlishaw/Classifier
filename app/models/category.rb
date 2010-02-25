class Category < ActiveRecord::Base
  has_many :word_classifications
  has_many :words, :through => :word_classifications
  
  has_many :messages
  
  include HasWords
end