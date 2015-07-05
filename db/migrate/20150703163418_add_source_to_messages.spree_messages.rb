# This migration comes from spree_messages (originally 20150311220726)
class AddSourceToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :source, :string
    add_column :messages, :taxon_id, :integer
    rename_column :messages, :viewd, :viewed
    add_column :messages, :phone, :string
    add_column :messages, :vendor, :string
  end
end
