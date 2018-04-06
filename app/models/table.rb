class Table < ApplicationRecord
  belongs_to :floor
  has_many :bookings
  validates :floor_id, presence: true
end
