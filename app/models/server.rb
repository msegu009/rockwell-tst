class Server < ApplicationRecord
  belongs_to :club
  has_many :bookings
end
