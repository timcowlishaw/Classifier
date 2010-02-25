class Message < ActiveRecord::Base
  has_many :word_uses
  has_many :words, :through => :word_uses
  after_create :create_words_for_message
  belongs_to :feed, :polymorphic => true
  include HasWords
  
  def categorise!(category)
    words.each { |word| word.categorise!(category)}
    words.reload
  end
  
  def exists?
    !!Message.first(:conditions => {:author => self.author, :text => self.text, :location => self.location, :posted_at => self.posted_at, :feed_id => self.feed_id, :feed_type => self.feed_type})
  end
  
  def category
    Category.all.sort {|category_1, category_2| self.word_counts.dot_product(category_2.word_counts) <=>  self.word_counts.dot_product(category_1.word_counts)}.first
  end
  
  private
  
  def create_words_for_message
    Word.new_from_message(self)
  end  
  
end