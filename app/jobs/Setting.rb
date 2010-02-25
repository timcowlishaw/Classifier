class Setting < ActiveRecord::Base
  validates_uniqueness_of :key
  class << self
    def training?
      setting = Setting.find_by_key("training?")
      !setting || setting == "false"
    end
    
    def set_training
       setting = Setting.find_by_key("training?")
       setting.value = "true"
       setting.save
    end
    
    def unset_training
      setting = Setting.find_by_key("training?")
      setting.value = "false"
      setting.save
    end
  end
end