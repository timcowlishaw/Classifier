class MessagesController < ApplicationController

  def classify
    @message = Message.next_unclassified
    @categories = Category.all
    
    respond_to do |format|
      format.html
      format.js { render :js => {:text => @message.text}}
    end
  end

  def bulk_categorize
    params[:message].each do |message_id, message_params|
      message = Message.find(message_id)
      category = Category.find(message_params[:category_id])
      message.categorise!(category)      
    end
    redirect_to home_path
  end

  def categorise
    @message = Message.find(params[:id])
    @category = Category.find(params[:category_id])
    @message.categorise!(@category)
    respond_to do |format|
      format.html {redirect_to classify_messages_path}
      format.js { render :js => {:text => Message.random.text} }
    end
  end

end

