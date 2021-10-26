class Invite < ApplicationRecord
  belongs_to :sender, class_name: "Player", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "Player", foreign_key: "recipient_id"
  belongs_to :game

  validates :recipient_id, uniqueness: { scope: :game_id, message: "can't be invited to the game more than once." }
  # recepient can't be current user
  validate :recipient_joined_lineup_already?

  scope :invites_new,       -> { where(accepted: nil) }
  scope :invites_accepted,  -> { where(accepted: true) }
  scope :invites_declined,  -> { where(accepted: false) }

  def recipient_joined_lineup_already?
    errors.add(:base, "Player #{self.recipient.email} has already joined lineup.") if self.game.players_assigned.include?(self.recipient)
  end
end