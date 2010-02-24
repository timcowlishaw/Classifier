class Message < ActiveRecord::Base
  has_many :word_uses
  has_many :words, :through => :word_uses
  after_create :create_words_for_message
  
  
  def categorise!(category)
    words.each { |word| word.categorise!(category)}
    words.reload
  end
  
  private
  
  def create_words_for_message
    Word.new_from_message(self)
  end  
  
end