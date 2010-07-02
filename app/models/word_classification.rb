class WordClassification < ActiveRecord::Base
  belongs_to :word
  belongs_to :category
  validates_presence_of :word, :category
end

