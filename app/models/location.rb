class Location < ApplicationRecord
  has_many :games
  
  validates :title, presence: true
end
