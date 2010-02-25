class Setting < ActiveRecord::Base;
  validates_uniqueness_of :key
end