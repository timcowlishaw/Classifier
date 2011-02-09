class FeedsController < ApplicationController

  def update
    Feed.update_all!
    
    redirect_to home_path
  end

end

