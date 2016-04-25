class SetDefaultFalseForToolReturn < ActiveRecord::Migration
  def change
  	change_column :tools, :requestReturn, :boolean, default: false
  end
end
