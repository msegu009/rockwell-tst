class Table < ApplicationRecord
  belongs_to :floor
  has_many :bookings
end
