class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :words, :force => true do |t|
      t.string :text
      t.timestamps
    end
    
    create_table :categories, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :messages, :force => true do |t|
      t.text :text
      t.string :author
      t.string :location
      t.datetime :posted_at
      t.timestamps
    end
    
    create_table :word_classifications, :force => true do |t|
      t.integer :word_id
      t.integer :category_id
      t.timestamps
    end
    
    create_table :word_uses, :force => true do |t|
      t.integer :word_id
      t.integer :message_id
      t.timestamps
    end
    
  end

  def self.down
    drop_table :word_uses
    drop_table :word_classifications
    drop_table :categories
    drop_table :messages
    drop_table :words
  end
end
