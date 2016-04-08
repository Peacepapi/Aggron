class RemoveOwnerIdFromBorrow < ActiveRecord::Migration
  def change
  	remove_column :borrow_requests, :owner_id
  end
end
