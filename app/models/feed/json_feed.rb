class Feed
  class JsonFeed < Feed
    private
    
    def get_response
       uri = URI.parse(self.url)
       req = Net::HTTP::Get.new(uri.path)
       res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }
       return JSON.parse(res.body)
    end
    
  end
end