class Game < ApplicationRecord
  belongs_to :organizator, class_name: "Player", foreign_key: "organizator_id"
  belongs_to :location
  has_many :game_players, dependent: :destroy
  has_many :players_assigned, through: :game_players, source: :player
  has_many :invites

  accepts_nested_attributes_for :game_players
  
  validates :starting_time, presence: true
#  before_validation :before_validation_adjust_passed, on: :update
  after_create :send_notifications, if: -> { self.location.player_locations.count > 0}
  scope :games_player_in, -> (player) { joins(:game_players).where('game_players.player_id = ?', player.id) }
  
  def starting_time_formatted
    self.starting_time&.strftime("%H-%M (%d/%m/%Y)")
  end

  def end_time_formatted
    self.end_time&.strftime("%H-%M (%d/%m/%Y)")
  end

  def cancel
    self.confirmed = false
    save
    GameInfoNotificationSender.new(self, :game_cancelled).call
  end

  def confirm
    self.confirmed = true
    save
    GameInfoNotificationSender.new(self, :game_confirmed).call
  end

  def send_notifications
    LocationInfoNotificationSender.new(self, :game_created).call
  end

end
