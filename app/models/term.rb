class Term < ActiveRecord::Base
  has_many :term_classifications
  has_many :categories, :through => :term_classifications
  has_many :term_uses
  has_many :messages, :through => :term_uses
end