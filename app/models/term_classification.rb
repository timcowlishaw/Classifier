class TermClassification < ActiveRecord::Base
  belongs_to :term
  belongs_to :category
end