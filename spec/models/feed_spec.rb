require File.dirname(__FILE__) + '/../spec_helper'

describe Feed do
  describe "batch updating" do
    it "updates all feeds when update_all! is called on the class" do
      Feed::JsonFeed.any_instance.expects(:save_new_messages!).at_least_once.returns(true)
      feed_1 = Factory.create(:json_feed)
      feed_2 = Factory.create(:json_feed)
      Feed.update_all!
    end
  end
  
  describe "new messages" do
    it "does not include those for which we have already created message objects" do
      json_data = [{
        'author' => "Paul",
        'text' => "If you'll be my bodyguard, I can be your long-lost pal / I can call you Betty, and Betty when you call me you can call me Al.",
        'location' => "Here",
        'posted_at' => Date.parse("2010/01/04").to_time.to_s(:sql)
      }]
      feed = Factory.create(:json_feed)
      FakeWeb.register_uri(:get, feed.url, :body => json_data.to_json)
      message = feed.new_messages.first
      message.save
      feed.new_messages.should_not include(message)
    end
  end
  
  
end