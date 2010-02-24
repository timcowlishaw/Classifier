class Word < ActiveRecord::Base
  has_many :word_classifications
  has_many :categories, :through => :word_classifications
  has_many :word_uses
  has_many :messages, :through => :word_uses
  
  class << self
    def new_from_message(message)
      message.text.split(" ").map do |string| 
        word = Word.find_or_create_by_text(string.strip_non_alphanumeric.downcase.stem)
        WordUse.find_or_create_by_word_id_and_message_id(word.id, message.id)
        word
      end
    end
  end
end