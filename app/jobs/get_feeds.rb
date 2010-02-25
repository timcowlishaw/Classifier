class GetFeeds
  def perform
    Feed.update_all!
    Delayed::Job.enqueue(self, nil, Time.now + Feed::FETCH_DELAY)
  end
end