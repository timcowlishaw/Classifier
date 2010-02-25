class HomeController < ApplicationController
  def index
    @categories = [Category.find_by_name("Bright"), Category.find_by_name("Dark")]
  end
end