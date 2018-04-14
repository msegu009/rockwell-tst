class User < ApplicationRecord
	has_many :bookings
	validates :firstname, presence: true
	validates :lastname, presence: true
  	validates :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
	# validates :password_digest, presence: true
	has_secure_password


end
