class Floor < ApplicationRecord
  belongs_to :club
  has_many :tables
  validates :club_id, presence: true

  def available_tables(day)
  	self.tables.reject { |t| t.bookings.where(day: day).count > 0 }
  end
end
