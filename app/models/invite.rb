class Invite < ApplicationRecord
  belongs_to :sender, class_name: "Player", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "Player", foreign_key: "recipient_id"
  belongs_to :game

  validates :recipient_id, uniqueness: { scope: :game_id, message: "can't be invited to the game more than once." }
  # recepient can't be current user
  validate :recipient_joined_lineup_already?

  def recipient_joined_lineup_already?
    errors.add(:base, "Player #{self.recipient.email} has already joined lineup.") if self.game.players_assigned.include?(self.recipient)
  end

=begin
  def self.send_multiple!(ids)
    @ids.each { |p_id| @game.invites.create(recepient_id: p_id) }
      #unless invite.save
      #  invite.errors.full_messages.each { |mes| @errors_messages[:p_id] << mes }
      #end
  end
=end
end