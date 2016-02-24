class AddUserIdAndToolIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :integer
  	add_column :comments, :tool_id, :integer
  end
end
