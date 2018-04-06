class Booking < ApplicationRecord
  belongs_to :table
  belongs_to :server
  belongs_to :user
  validates :table_id, presence: true
  validates :server_id, presence: true
  validates :user_id, presence: true
end
