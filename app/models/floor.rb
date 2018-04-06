class Floor < ApplicationRecord
  belongs_to :club
  has_many :tables
end
