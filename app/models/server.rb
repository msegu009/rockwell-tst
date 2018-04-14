class Server < ApplicationRecord
  belongs_to :club
  has_many :bookings
  validates :club_id, presence: true
  SERVER_UPCHARGE = 150
end
