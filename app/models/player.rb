class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :confirmable, 
          :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable
  
  has_many :games_organized, class_name: "Game", foreign_key: "organizator_id"
  has_many :game_players
  has_many :games_player_in, through: :game_players, source: :game
  has_many :notifications, foreign_key: "recepient_id"
  has_many :invites_received, class_name: "Invite", foreign_key: "recipient_id"
  has_many :invites_sent, class_name: "Invite", foreign_key: "sender_id"

  scope :players_in_game,               -> (game) {joins(:game_players).where('game_players.game_id = ?', game.id)}
  scope :players_not_in_game,           -> (game) {where('id NOT IN (?)', players_in_game(game).pluck(:id))}
  scope :players_invited_in_game,       -> (game) {joins('INNER JOIN invites ON invites.recipient_id = players.id').where('invites.game_id = ?', game.id)}
  scope :players_available_for_invite,  -> (game) {players_not_in_game(game).where.not(id: Player.players_invited_in_game(game))}
  scope :current_user, -> {where(id: current_player.id)}

  def join_game(game)
    game.players_assigned << self
  end

  def leave_game(game)
    game_player(game).destroy
  end

  def game_player(game)
    GamePlayer.where(player_id: self.id, game: game.id).first
  end

  # --------------------

  def self.all_with_counts
    all.map do |player|
      { id: player.id, games_player_in_count: Game.games_player_in(player).count }
    end
  end
end
