class ChangedUserIdForToolsToOwnerId < ActiveRecord::Migration
  def change
  	rename_column :tools, :user_id, :owner_id
  end
end
