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
rockwell_server_list=[
  ["Bracks", "rockwell_bracks", "bracksss", 1],
  ["Gracee", "rockwell_gracee", "graceelove", 1],
  ["Jyll", "rockwell_jyll", "jyllmarie", 1],
  ["Kaite", "rockwell_kaite", "kaitsgreat", 1],
  ["Kristy", "rockwell_kristy", "kristylslife", 1],
  ["Nancy", "rockwell_nancy", "nancyismia", 1],
  ["Tessa", "rockwell_tessa", "tess_valdera", 1],
  ["Vess", "rockwell_vee", "vee_lynn", 1]
]
Server.destroy_all
rockwell_server_list.each do |server|
  Server.create( :name => server[0], :photo => server[1], :instagram => server[2], :club_id => server[3])
end
