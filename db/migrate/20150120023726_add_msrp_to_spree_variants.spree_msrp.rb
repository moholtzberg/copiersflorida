# This migration comes from spree_msrp (originally 20140806232319)
class AddMsrpToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :msrp, :decimal, :precision => 8, :scale => 2
  end
end
