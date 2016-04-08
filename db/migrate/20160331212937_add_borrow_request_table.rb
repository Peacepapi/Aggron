class AddBorrowRequestTable < ActiveRecord::Migration
  def change
  	create_table :borrow_requests do |t|
  		t.integer :borrower_id
  		t.integer :lender_id
  		t.integer :requestedTool_id
  		t.timestamps
 	end
  end
end
