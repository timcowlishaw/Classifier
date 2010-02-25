class AddSystemSettings < ActiveRecord::Migration
  def self.up
    create_table :settings, :force => true do |t|
      t.string :key
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
