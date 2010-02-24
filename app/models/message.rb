class Message < ActiveRecord::Base
  has_many :word_uses
  has_many :words, :through => :word_uses
end