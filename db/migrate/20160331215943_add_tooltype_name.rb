class AddTooltypeName < ActiveRecord::Migration
  def change
  	remove_column :tooltypes, :category
  	add_column :tooltypes, :name, :string
  end
end
