class AddTooltypeId < ActiveRecord::Migration
  def change
  	add_column :tooltypes, :tooltype_id, :integer
  end
end
