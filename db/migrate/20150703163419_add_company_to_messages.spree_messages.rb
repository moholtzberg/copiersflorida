# This migration comes from spree_messages (originally 20150703162255)
class AddCompanyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :company, :string
  end
end
