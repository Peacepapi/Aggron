# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tooltype.create(:name => "Power Tools")
Tooltype.create(:name => "Work Wear")
Tooltype.create(:name => "Hand Tools")
Tooltype.create(:name => "Ladder")
Tooltype.create(:name => "Gardening Tools")
Tooltype.create(:name => "Heavy Duty")