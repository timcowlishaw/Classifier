class Word < ActiveRecord::Base
  has_many :word_classifications
  has_many :categories, :through => :word_classifications
  has_many :word_uses
  has_many :messages, :through => :word_uses
end