class WordUse < ActiveRecord::Base
  belongs_to :word
  belongs_to :message
  
  validates_presence_of :word, :message
  
  class << self
    def find_or_create_by_word_and_message(word, message)
      first(:conditions => {:word_id => word.id, :message_id => message.id}) || create(:word => word, :message => message)
    end
  end
end

