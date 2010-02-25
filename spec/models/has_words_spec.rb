shared_examples_for "HasWords" do
    
  before :each do 
    @object = @klass.create(@hash)
    @other_object = @klass.create(@hash)
    
    @through_class = @klass.reflections[:words].through_reflection.class_name.constantize
    
    #Ensure we've a clean database, in case any after_create callbacks on @klass had side effects
    @through_class.all.map(&:destroy)
    Word.all.map(&:destroy)
    
    @words = %w(one two three).map {|w| Word.create(:text => w)}.sort {|a,b| a.id <=> b.id}
    
    @words.each_with_index do |word, index|
      (index +1).times do
        @through_class.create(@klass.name.underscore => @object, :word => word)
      end
    end
    
  end
  
  it "should include HasWords" do
    @klass.should include(HasWords)
  end
  
  describe "word_counts" do
    it "returns the count of each term that is related to the object, in order of object_id" do
      Word.all.map(&:text).should == %w(one two three)
      @object.word_counts.should == [1,2,3]
    end
    
    it "returns a count of 0 for words with no relation" do
      words_with_blank = (@words + [Word.create(:text => "four")])
      Word.all.map(&:text).should == %w(one two three four)
      @object.word_counts.should == [1,2,3,0]
    end
    
    it "does not include relations to other objects in the count" do
      @words.each { |word| @through_class.create(@klass.name.underscore => @other_object, :word => word) }
      Word.all.map(&:text).should == %w(one two three)
      @object.word_counts.should == [1,2,3]
    end
  end
    
end