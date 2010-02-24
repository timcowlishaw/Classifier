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
      @message.words.reload.each {|word| word.should_receive(:categorise!).with(@category)}
      @message.categorise!(@category)
    end
     
  end
  

end