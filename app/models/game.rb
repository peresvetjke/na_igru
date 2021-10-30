class Game < ApplicationRecord
  belongs_to :organizator, class_name: "Player", foreign_key: "organizator_id"
  belongs_to :location
  has_many :game_players, dependent: :destroy
  has_many :players_assigned, through: :game_players, source: :player
  has_many :invites

  accepts_nested_attributes_for :game_players
  
  validates :starting_time, presence: true
  validate  :validate_end_time_more_than_starting
#  before_validation :before_validation_adjust_passed, on: :update
  after_create :send_notifications, if: -> { self.location.player_locations.count > 0}
  
  default_scope {where('confirmed IS NOT ?', false) }
  scope :games_player_in, -> (player) { joins(:game_players).where('game_players.player_id = ?', player.id) }
  
  def cancel
    self.confirmed = false
    save
    GameInfoNotificationSender.new(self, self.players_assigned, :game_cancelled).call
  end

  def confirm
    self.confirmed = true
    save
    GameInfoNotificationSender.new(self, self.players_assigned, :game_confirmed).call
  end

  def send_notifications
    NotificationSender.new(self, Player.players_with_favorite_location, 'New game created on your favorite location.').call
  end

  def validate_end_time_more_than_starting
    errors.add :base, message: "End time can't be before the starting time" unless self.end_time > self.starting_time
  end
end
