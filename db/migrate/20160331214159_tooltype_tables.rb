class TooltypeTables < ActiveRecord::Migration
  def self.up
    Tooltype.create(:name => "Power Tools")
    Tooltype.create(:name => "Work Wear")
    Tooltype.create(:name => "Hand Tools")
    Tooltype.create(:name => "Ladder")
    Tooltype.create(:name => "Gardening Tools")
    Tooltype.create(:name => "Heavy Duty")
  end

  def self.down
    Tooltype.delete_all()
  end
end