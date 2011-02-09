class HomeController < ApplicationController
  def index
    @categories = [Category.find_by_name("Bright"), Category.find_by_name("Dark")]
    @category_choices = [Category.find_by_name("Bright"), Category.find_by_name("Neutral"), Category.find_by_name("Dark")]
  end
end