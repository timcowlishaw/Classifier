class TermUse < ActiveRecord::Base
  belongs_to :term
  belongs_to :message
end