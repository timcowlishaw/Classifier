class MessagesController < ApplicationController

  def random
    @message = Message.random
    @categories = Category.all
    
    respond_to do |format|
      format.html
      format.js { render :js => {:text => @message.text}}
    end
  end

  def categorise
    @message = Message.find(params[:id])
    @category = Category.find(params[:category_id])
    @message.categorise!(@category)
    respond_to do |format|
      format.html {redirect_to random_messages_path}
      format.js { render :js => {:text => Message.random.text} }
    end
  end

end

