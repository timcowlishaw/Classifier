require File.dirname(__FILE__) + '/../spec_helper'

describe Word do
  describe "Class Methods" do
    describe "instantiation from a message" do
      
      before :each do
        @message = Factory.build(:message, :text => "Rain Spain Plain")
      end
        
      it "returns terms for all words in the message" do
        Word.new_from_message(@message).map(&:text).to_set.should == @message.text.split(' ').map(&:downcase).to_set
      end
      
      it "stems all terms not in root form" do
        @message = Factory.build(:message, :text => "It rains in Spain.")
        Word.new_from_message(@message).map(&:text).should include("rain")
      end
      
      it "disregards punctuation" do
        @message = Factory.build(:message, :text => " Does it rain in Spain? Tell me! It rains in Spain.")
        Word.new_from_message(@message).map(&:text).each do |term|
          ['.', '?', '!'].each do |symbol|
            term.should_not include(symbol)
          end
        end
      end
      
      it "is case-insensitive" do
        Word.new_from_message(@message).map(&:text).should include("spain")
      end
      
      it "returns any already-existing terms from the message" do
        term = Factory.create(:word, :text => "spain")
        Word.new_from_message(@message).should include(term)
      end
      
      it "creates WordUses relating these terms to the message they are instantiated from." do
        terms = Word.new_from_message(@message)
        terms.should be_a_subset_of(@message.words.reload)
      end
      
      it "does not create WordUses when one already exists relating this term to this message" do
        Word.new_from_message(@message)
        word_uses = @message.word_uses.reload
        Word.new_from_message(@message).map {|t| t.word_uses}.flatten.to_set.should == word_uses.to_set
      end
    end
  end
  describe "training" do
    it "creates categorisations when categorised" do
      word = Factory.create(:word)
      category = Factory.create(:category)
      word.categorise!(category)
      word.reload.categories.should include(category)
    end
    
    it "does not delete previous classifications" do
      word = Factory.create(:word)
      category = Factory.create(:category)
      word.categorise!(category)
      category_2 = Factory.create(:category)
      word.categorise!(category_2)
      word.reload.categories.should include(category)
    end
    
    it "allows multiple categorisations for the same word and category" do
      word = Factory.create(:word)
      category = Factory.create(:category)
      word.categorise!(category)
      word.categorise!(category)
      word.reload.categories.length.should == 2
      word.reload.categories.to_set.should == [category].to_set
    end
    
  end
end