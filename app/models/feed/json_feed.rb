class Feed
  class JsonFeed < Feed
    private
    
    def parse_individual(hash)
      Message.new({
        :text => JSONPath.lookup(hash, text_selector).compact.first,
        :location => JSONPath.lookup(hash, location_selector).compact.first,
        :posted_at => DateTime.parse(JSONPath.lookup(hash, posted_at_selector).compact.first),
        :author => JSONPath.lookup(hash, author_selector).compact.first,
        :feed => self
      })
    end
    
    def get_response
       uri = URI.parse(self.url)
       req = Net::HTTP::Get.new(uri.path)
       res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }
       json = JSON.parse(res.body)
       return json 
    end
    
  end
end