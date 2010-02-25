class AddDenormalisedCategoryToMessages < ActiveRecord::Migration
  def self.up
    add_index :word_uses, :word_id
    add_index :word_uses, :message_id
    add_index :word_classifications, :word_id
    add_index :word_classifications, :category_id
    add_column :messages, :category_id, :integer
    add_index :messages, :category_id
  end

  def self.down
    remove_index :messages, :category_id
    remove_column :messages, :category_id
    remove_index :word_classifications, :category_id
    remove_index :word_classifications, :word_id
    remove_index :word_uses, :message_id
    remove_index :word_uses, :word_id
  end
end
