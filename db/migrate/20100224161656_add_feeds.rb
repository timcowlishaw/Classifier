class AddFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds, :force => true do |t|
      t.string :type
      t.string :name
      t.string :username
      t.string :password
      t.string :url
      t.string :text_selector
      t.string :author_selector
      t.string :location_selector
      t.string :posted_at_selector
      t.timestamps
    end
    add_column :messages, :feed_id, :integer
    add_column :messages, :feed_type, :string
  end

  def self.down
    remove_column :messages, :feed_type
    remove_column :messages, :feed_id
    drop_table :feeds
  end
end
