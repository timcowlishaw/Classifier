class GetFeeds
  def perform
    Feed.all.each {|feed| feed.save_new_messages!}
    Delayed::Job.enqueue(self, nil, Time.now + Feed::FETCH_DELAY)
  end
end