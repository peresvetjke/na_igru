class Location < ApplicationRecord
  has_many :games
  has_many :player_locations
  
  validates :title, presence: true
  validate :coordinates_maintained

  def address
    "#{self.region}, #{self.district}, #{self.place}"
  end

  private

  def coordinates_maintained
    unless self.lng.present? && self.lat.present?
      errors.add :base, message: "Please mark location on map."
    end
  end
end
