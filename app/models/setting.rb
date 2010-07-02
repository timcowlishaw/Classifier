class Setting < ActiveRecord::Base
  validates_uniqueness_of :key
  class << self
    def training?
      s = Setting.find_by_key("training?") && s.value == "true"
    end
    
    def start_training!
       setting = Setting.find_or_create_by_key("training?")
       setting.value = "true"
       setting.save
    end
    
    def stop_training!
      setting = Setting.find_or_create_by_key("training?")
      setting.value = "false"
      setting.save
    end
  end
end

