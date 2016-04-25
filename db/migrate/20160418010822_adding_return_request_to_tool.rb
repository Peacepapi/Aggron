class AddingReturnRequestToTool < ActiveRecord::Migration
  def change
  	add_column :tools, :requestReturn, :boolean
  end
end
