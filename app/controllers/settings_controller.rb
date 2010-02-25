class SettingsController < ApplicationController
  def start_training
    Setting.start_training!
    redirect_to classify_messages_path
  end
  
  def stop_training
    Setting.stop_training!
    redirect_to classify_messages_path
  end
  
end