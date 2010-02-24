class Feed < ActiveRecord::Base
  
  FETCH_DELAY = 5.minutes
  
  has_many :messages, :as => :feed
  
  abstract_class=true
  
  class << self
    def import_all_from_yaml
      YAML.load_file("config/feeds.yml").each do |hash|
        hash.symbolize_keys!
        klass = hash.delete(:class).constantize
        klass.create(hash) unless first(:conditions => {:url => hash[:url]})
      end
    end
  end
  
  def messages
    response.map do |data|
      Message.new({
        :text => JSONPath.lookup(data, text_selector),
        :location => JSONPath.lookup(data, location_selector),
        :posted_at => JSONPath.lookup(data, posted_at_selector),
        :author => JSonPath.lookup(data, author_selector),
        :feed => self
      })
    end
  end
  
  def new_messages
     messages.reject( message.exists?(self) )
  end
   
   def save_new_messages!
     return new_messages.each {|m| m.save }.inject(true) {|m, n| m &&n}
   end
   
  private
  
  def response 
    @response ||= get_response
  end
  
  def get_response
    raise NotImplementedError
  end
  
end