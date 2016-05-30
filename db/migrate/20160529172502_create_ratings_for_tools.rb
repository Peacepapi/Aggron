class CreateRatingsForTools < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.boolean :like
    	t.integer :reviewer_id
    	t.boolean :rated
    	t.integer :tool_id
    	t.timestamps
    end
  end
end
