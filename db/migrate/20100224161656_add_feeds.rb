class AddFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds, :force => true do |t|
      t.string :type
      t.string :name
      t.string :username
      t.string :password
      t.string :url
      t.timestamps
    end
    add_column :messages, :feed_id, :integer
  end

  def self.down
    remove_column :messages, :feed_id
    drop_table :feeds
  end
end
