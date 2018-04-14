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
User.create(firstname: "Pat", lastname: "Patterson", email: "mail@mail.com", password: "password", password_confirmation: "password")
5.times do
  User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password")
end

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
    ["Owner's Table", "0", false, floor.id],
    ["Table 14", "500", true, floor.id],
    ["Table 15", "500", true, floor.id],
    ["Table 16", "500", true, floor.id],
    ["Table 17", "1,000", true, floor.id],
    ["Table 18", "2,000", true, floor.id],
    ["Table 19", "1,000", true, floor.id]
  ]

Table.destroy_all
table_list.each do |table|
  Table.create( :name => table[0], :min_price => table[floor.id], :available_today => table[2], :floor_id => table[3])
end



rockwell_server_list= [
  ["Bracks", "rockwell_bracks", "bracksss", 11],
  ["Gracee", "rockwell_gracee", "graceelove", 11],
  ["Jyll", "rockwell_jyll", "jyllmarie", 11],
  ["Kaite", "rockwell_kaite", "kaitsgreat", 11],
  ["Kristy", "rockwell_kristy", "kristylslife", 11],
  ["Nancy", "rockwell_nancy", "nancyismia", 11],
  ["Tessa", "rockwell_tessa", "tess_valdera", 11],
  ["Vess", "rockwell_vee", "vee_lynn", 11]
]

Server.destroy_all
rockwell_server_list.each do |server|
  Server.create( :name => server[0], :photo => server[1], :instagram => server[2], :club_id => server[3])
end


table_for_bookings = ((1..12).to_a + (14..19).to_a).shuffle!
users_for_booking = User.all.pluck(:id).shuffle!

10.times do
  males = rand(5)
  amb = ( (males >= 3) ? true : false )
  table = Table.find(table_for_bookings.pop)
  user = users_for_booking.pop
  server_upcharge = Server::SERVER_UPCHARGE
  ambiance_upcharge = ( amb ? 200 : 0 )

  exp_spend = table.min_price.to_i + server_upcharge + ambiance_upcharge

  Booking.create( day: "28/05/2018".to_date,
                  num_of_males: males,
                  num_of_females: rand(5),
                  atmosphere: amb,
                  table_id: table.id ,
                  server_id: Server.all.pluck(:id).sample,
                  user_id: user,
                  expected_spend: exp_spend
                )


end
