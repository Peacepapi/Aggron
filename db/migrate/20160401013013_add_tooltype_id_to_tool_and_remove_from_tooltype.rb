class AddTooltypeIdToToolAndRemoveFromTooltype < ActiveRecord::Migration
  def change
  	remove_column :tooltypes, :tooltype_id
  	add_column :tools, :tooltype_id, :integer
  end
end
