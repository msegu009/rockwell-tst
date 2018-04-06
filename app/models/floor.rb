class Floor < ApplicationRecord
  belongs_to :club
  has_many :tables
  validates :club_id, presence: true
end
