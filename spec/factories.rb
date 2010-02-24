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