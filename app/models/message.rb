class Message < ActiveRecord::Base
  has_many :term_uses
  has_many :terms, :through => :term_uses
end