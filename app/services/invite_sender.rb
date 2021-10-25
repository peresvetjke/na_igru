class InviteSender

  def initialize(player_ids, game)
    @ids = ids
    @game = game
    @errors_messages = ''
  end

  def call
    @ids.each do |p_id|
      invite = @game.invites.new(recepient_id: p_id)
      unless invite.save
        invite.errors.full_messages.each { |mes| @errors_messages[:p_id] << mes }
      end
    end
  end
end