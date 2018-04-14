class Club < ApplicationRecord
  has_many :floors
  has_many :servers
  has_many :tables, through: :floors
end
