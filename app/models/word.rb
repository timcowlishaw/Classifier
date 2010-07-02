class Word < ActiveRecord::Base
  belongs_to :feed
  
  has_many :word_classifications
  has_many :categories, :through => :word_classifications
  has_many :word_uses
  has_many :messages, :through => :word_uses
  
  class << self
    def new_from_message(message)
      message.text.to_classifiable_words.map do |string| 
        word = Word.find_or_create_by_text(string)
        WordUse.find_or_create_by_word_and_message(word, message)
        word
      end
    end
  end
  
  def categorise!(category)
    wc = WordClassification.create(:word => self, :category => category)
    self.reload
    return wc
  end
  
end

