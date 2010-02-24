class Feed < ActiveRecord::Base
  has_many :messages
end