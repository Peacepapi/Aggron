class ChangeBorrowerAndLenderIdToOwnerAndRequester < ActiveRecord::Migration
  def change
  	rename_column :borrow_requests, :borrower_id, :requester_id
  	rename_column :borrow_requests, :lender_id, :owner_id

  end
end
