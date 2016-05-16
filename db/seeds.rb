# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
power = Tooltype.create(:name => "Power Tools")
work = Tooltype.create(:name => "Work Wear")
hand = Tooltype.create(:name => "Hand Tools")
ladder = Tooltype.create(:name => "Ladder")
gardening = Tooltype.create(:name => "Gardening Tools")
heavy = Tooltype.create(:name => "Heavy Duty")

jimmy = User.create(username: 'Jimmy Carter', email: 'JimmyC@poop.com', password: '1234567', password_confirmation: '1234567')
george = User.create(username: 'George Choo', email: 'GeorgeC@poop.com', password: '1234567', password_confirmation: '1234567')
tooth = User.create(username: 'Little Tooth', email: 'LittleT@poop.com', password: '1234567', password_confirmation: '1234567')
bingo = User.create(username: 'bingo', email: 'bingo@poop.com', password: '1234567', password_confirmation: '1234567')
derp = User.create(username: 'Potatoes', email: 'Potatoes@poop.com', password: '1234567', password_confirmation: '1234567')
peace = User.create(username: 'Peace', email: 'Peace@poop.com', password: '1234567', password_confirmation: '1234567')

jimmy.tools.create(name: 'Drill', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget sapien lacus. Sed imperdiet efficitur sem, vitae blandit erat fermentum quis.', tooltype: hand)
jimmy.tools.create(name: 'Helmet', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget sapien lacus. Sed imperdiet efficitur sem, vitae blandit erat fermentum quis.', tooltype: work)
george.tools.create(name: 'Power Drill', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisi astomps.', tooltype: power)
peace.tools.create(name: 'Shovel', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisi a maunc .', tooltype: hand)
derp.tools.create(name: 'Wrench', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisi a mattis sa.', tooltype: hand)
peace.tools.create(name: 'Hammer', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculiet sapien feugiat tempus.', tooltype: hand)
jimmy.tools.create(name: 'Shear', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisi a mattis.', tooltype: gardening)
tooth.tools.create(name: 'Slegde Hammer', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisiitonec tipus.', tooltype: heavy)
tooth.tools.create(name: 'Screwdriver', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus elit diam, et laoreet urna iaculis at. Proin laoreet nisi a maeget us.', tooltype: hand)
peace.tools.create(name: 'Pliers', description: 'Lorem ipsum ds.', tooltype: hand)
derp.tools.create(name: 'hand saw', description: 'Lorem ipsum, et laoreet urna iaculis at. tempor vestibulum justo eget imperdiet. Donec tincidunt nunc et sapien feugiat tempus.', tooltype: hand)
