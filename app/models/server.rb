class Server < ApplicationRecord
  belongs_to :club
  has_many :bookings
  validates :club_id, presence: true
end
