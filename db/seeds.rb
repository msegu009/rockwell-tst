# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
# 	Club.create({
# 		name: Faker::Pokemon.name
# 		})
# end
#
# puts "hold up"
# Table.destroy_all
club = Club.create(:name => "Rockwell", :city => "Miami")

floor = Floor.create(:name =>"1", :club_id => club.id)

# floors = []
#
# 5.times do |num|
#   num += 1
#   floors << Floor.create(name: "#{num}", club: club)
# end
#
# floors.each do |floor|
#   10.times do |num|
#     Table.create(name: "Table #{num}", min_price: "250", available_today: true, floor: floor)
#   end
# end

table_list=[
    ["Table 1", "250", true, floor.id],
    ["Table 2", "250", true, floor.id],
    ["Table 3", "250", true, floor.id],
    ["Table 4", "250", true, floor.id],
    ["Table 5", "500", true, floor.id],
    ["Table 6", "500", true, floor.id],
    ["Table 7", "500", true, floor.id],
    ["Table 8", "500", true, floor.id],
    ["Table 9", "250", true, floor.id],
    ["Table 10", "250", true, floor.id],
    ["Table 11", "250", true, floor.id],
    ["Table 12", "250", true, floor.id],
    ["Owner's Table", "21", false, floor.id],
    ["Table 14", "500", true, floor.id],
    ["Table 15", "500", true, floor.id],
    ["Table 16", "500", true, floor.id],
    ["Table 17", "1,000", true, floor.id],
    ["Table 18", "2,000", true, floor.id],
    ["Table 19", "1,000", true, floor.id]
  ]

table_list.each do |table|
  Table.create( :name => table[0], :min_price => table[floor.id], :available_today => table[2], :floor_id => table[3])
end
puts "seed file finished running"
