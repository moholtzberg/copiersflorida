# This migration comes from spree_messages (originally 20150311220725)
class CreateMessageSettings < ActiveRecord::Migration
  def self.up
    create_table :message_settings do |t|
      t.integer :store_id
      t.string  :name
      t.string  :address
      t.string  :city
      t.integer :country_id
      t.integer :state_id
      t.string  :zip
      t.string  :phone
      t.string  :fax
      t.string  :email
      t.text    :notes
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :message_settings
  end
end