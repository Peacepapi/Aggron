class AddBorrowerIdToTools < ActiveRecord::Migration
  def change
  	add_column :tools, :borrower_id, :integer
  end
end
