class ChangeTooltypeColumn < ActiveRecord::Migration
  def change
  	rename_column :tooltypes, :category, :name 
  end
end
