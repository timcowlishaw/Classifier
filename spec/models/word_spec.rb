require File.dirname(__FILE__) + '/../spec_helper'

describe Word do
  describe "Class Methods" do
    describe "instantiation from a message" do
      
      before :each do
        @message = Factory.create(:message, :text => "Rain Spain Plain")
      end
        
      it "returns terms for all words in the message" do
        Word.new_from_message(@message).map(&:text).to_set.should == @message.text.split(' ').map(&:downcase).to_set
      end
      
      it "stems all terms not in root form" do
        @message = Factory.create(:message, :text => "It rains in Spain.")
        Word.new_from_message(@message).map(&:text).should include("rain")
      end
      
      it "disregards punctuation" do
        @message = Factory.create(:message, :text => " Does it rain in Spain? Tell me! It rains in Spain.")
        Word.new_from_message(@message).map(&:text).each do |term|
          ['.', '?', '!'].each do |symbol|
            term.should_not include(symbol)
          end
        end
      end
      
      it "is case-insensitive" do
        Word.new_from_message(@message).map(&:text).should include("spain")
      end
      
      it "returns the already-existing terms from the message" do
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
  
end