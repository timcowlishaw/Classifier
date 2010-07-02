require File.dirname(__FILE__) + '/../../spec_helper'

describe Feed::JsonFeed do
  before :each do
    @json_data = [{
      'author' => "Kirsty",
      'text' => "I saw two shooting stars last night / I wished on them, but they were only satellites",
      'location' => "Here",
      'posted_at' => Date.parse("2010/01/04").to_time.to_s(:sql)
    }]
    @feed = Factory.create(:json_feed)
    FakeWeb.register_uri(:get, @feed.url, :body => @json_data.to_json)
  end
  
  describe "fetched messages" do
    it "returns new message objects for all the items in the feed" do
      @feed.fetched_messages.length.should == 1
      message = @feed.fetched_messages.first
      message.author.should == @json_data.first['author']
      message.text.should == @json_data.first['text']
      message.location.should == @json_data.first['location']
      message.posted_at.should == @json_data.first['posted_at']
      message.feed.should == @feed
    end
  end
end