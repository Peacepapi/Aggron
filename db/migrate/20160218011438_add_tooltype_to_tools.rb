class AddTooltypeToTools < ActiveRecord::Migration
  def change
  	  	add_column :tools, :tooltype_id, :integer
  end
end
