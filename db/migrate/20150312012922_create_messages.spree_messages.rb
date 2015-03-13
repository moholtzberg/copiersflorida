# This migration comes from spree_messages (originally 20150311220724)
class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :order_id
      t.string  :name
      t.string  :email
      t.text  :message
      t.boolean :viewd
      t.boolean :complete
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end