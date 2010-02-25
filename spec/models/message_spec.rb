require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  
  describe "Initialization" do
    it "creates word associations for all included terms on create" do
      message = Factory.build(:message, :text => "There was a young lawyer named Rex")
      message.word_uses.should be_empty
      message.save!
      message.reload.words.map(&:text).to_set.should == message.text.to_classifiable_words.to_set
    end
  end
  
  describe "Classifier training" do
    before(:each) do
      @message = Factory.create(:message, :text => "There was a young man from Bel-Air")
      @category = Factory.create(:category)
    end
    
    it "classify all its terms when classified" do
      @message.words.map(&:word_classifications).flatten.should be_empty
      @message.words.reload.each {|word| word.expects(:categorise!).with(@category)}
      @message.categorise!(@category)
    end
     
  end
  
  describe "Existence" do
    
    before :each do
      @message = Factory.build(:message)
    end
    
    it "returns true from exists? when a similar record already exists" do
      @message.save
      
      message_2 = Factory.build(:message, {
        :author => @message.author,
        :text => @message.text,
        :location => @message.location,
        :posted_at => @message.posted_at,
        :feed_id => @message.feed_id,
        :feed_type => @message.feed_type
      })
      
      message_2.exists?.should be_true
    end
    
    it "returns false from exists? when a similar record does not exist" do
      @message.exists?.should be_false
    end
    
  end
  

end