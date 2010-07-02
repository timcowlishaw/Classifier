Factory.define(:message) do |message|
  message.author "mistertim"
  message.location "London, UK"
  message.posted_at Date.parse("2010/01/01").to_time
  message.text "I've got a lovely bunch of coconuts"
end


Factory.define(:word) do |word|
  word.text "gubbins"
end


Factory.define(:category) do |category|
  category.name "Excellent"
end

Factory.define(:json_feed, :class => Feed::JsonFeed) do |feed|
  feed.name "Test JSON feed"
  feed.url "http://www.example.com/json_feed"
  feed.author_selector "$.author"
  feed.location_selector "$.location"
  feed.posted_at_selector "$.posted_at"
  feed.text_selector "$.text"
end