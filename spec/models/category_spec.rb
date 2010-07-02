require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/has_words_spec'

describe Category do
  describe "HasWords mixin" do
    before :all do
      @klass = Category
      @hash = {:name => "test"}
    end

    it_should_behave_like "HasWords"

  end
  
end
