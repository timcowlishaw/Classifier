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
    
    def update_all!
      all.each {|feed| feed.save_new_messages!}
    end
  end
  
  def fetched_messages
    response.map { |datum| parse_individual(datum) }
  end
  
  def new_messages
    fetched_messages.reject { |message| message.exists? }
  end
   
   def save_new_messages!
     return new_messages.each {|m| m.save }.inject(true) {|m, n| m &&n}
   end
   
  private
  
  def response 
    @response ||= get_response
  end
  
  def parse_individual(datum)
    raise NotImplementedError
  end  
  
  def get_response
    raise NotImplementedError
  end
  
end