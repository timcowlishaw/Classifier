require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/has_words_spec'

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
  
  describe "HasWords mixin" do
    before :all do
      @klass = Message
      @hash = {:text => "test"}
    end
    
    it_should_behave_like "HasWords"
    
  end

  describe "derived category" do
    it "returns the category whose word_counts vector has the highest dot product with our own" do
      message = Factory.create(:message)
      
      category_1 = Factory.create(:category)
      category_2 = Factory.create(:category)
      
      message.stubs(:word_counts).returns([1,1,1])
      category_1.stubs(:word_counts).returns([0,0,0])
      category_2.stubs(:word_counts).returns([1,1,1])
      
      Category.stubs(:all).returns([category_1, category_2])
      
      message.derived_category.should == category_2
    end
    
  end

end