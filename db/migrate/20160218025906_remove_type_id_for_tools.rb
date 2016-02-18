class RemoveTypeIdForTools < ActiveRecord::Migration
  def change
  	  remove_column :tools, :type_id
  end
end
