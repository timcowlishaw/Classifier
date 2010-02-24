class WordUse < ActiveRecord::Base
  belongs_to :word
  belongs_to :message
end