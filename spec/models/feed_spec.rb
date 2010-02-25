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
end