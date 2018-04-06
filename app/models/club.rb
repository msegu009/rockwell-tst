class Club < ApplicationRecord
  has_many :floors
  has_many :servers
end
