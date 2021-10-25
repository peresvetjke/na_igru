class InvitesController < ApplicationController
  before_action :find_game, only: %i[create send_multiple]
  before_action :set_recipient, only: :create

  def index
    @invites = current_player.invites_sent
  end

  def send_multiple
    Invite.send_mupltiple!(params[:ids])
    redirect_to player_notifications_path(current_player), notice: "Invites sent."
  end

  def update

  end

  def create
    @invite = @game.invites.new(sender: current_player, recipient: @recipient)

    if @invite.save
      redirect_to game_path(@game), notice: "Invite sent to #{@recipient.email}"
    else
      render 'games/show'
    end
  end

  def destroy

  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_notification
    @notification = Notification.find(params[:id])
  end
  
  def invite_params
    params.require(:invi).permit(:body)
  end

  def set_recipient
    @recipient = Player.find(params[:id])
  end

end