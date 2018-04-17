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
#     Table.create(name: "Table #{num}", min_price: price, available_today: true, floor: floor)
#   end
# end

# tablelist = []
# 20.times do |t|
#   tablelist <<  ["Table #{t}", Random.rand(250, 2000), true, floor.id]
# end

price = 250
price2 = 500
price3 = 1000
price4 = 2000
table_list=[
    ["Table 1", price, true, floor.id],
    ["Table 2", price, true, floor.id],
    ["Table 3", price, true, floor.id],
    ["Table 4", price, true, floor.id],
    ["Table 5", price2, true, floor.id],
    ["Table 6", price2, true, floor.id],
    ["Table 7", price2, true, floor.id],
    ["Table 8", price2, true, floor.id],
    ["Table 9", price, true, floor.id],
    ["Table 10", price, true, floor.id],
    ["Table 11", price, true, floor.id],
    ["Table 12", price, true, floor.id],
    ["Owner's Table", 0, false, floor.id],
    ["Table 14", price2, true, floor.id],
    ["Table 15", price2, true, floor.id],
    ["Table 16", price2, true, floor.id],
    ["Table 17", price3, true, floor.id],
    ["Table 18", price4, true, floor.id],
    ["Table 19", price3, true, floor.id]
  ]

Table.destroy_all
table_list.each do |table|
  Table.create( :name => table[0], :min_price => table[floor.id], :available_today => table[2], :floor_id => table[3])
end


rockwell_server_list= [
  ["Bracks", "rockwell_bracks", "bracksss", 1],
  ["Gracee", "rockwell_gracee", "graceelove", 1],
  ["Jyll", "rockwell_jyll", "jyllmarie", 1],
  ["Kaite", "rockwell_kaite", "kaitsgreat", 1],
  ["Kristy", "rockwell_kristy", "kristylslife", 1],
  ["Nancy", "rockwell_nancy", "nancyismia", 1],
  ["Tessa", "rockwell_tessa", "tess_valdera", 1],
  ["Vess", "rockwell_vee", "vee_lynn", 1],
  ["Via","rockwell_viakoko","via.koko_", 1]
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
