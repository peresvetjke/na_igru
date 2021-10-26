class InvitesController < ApplicationController
  before_action :find_game, only: %i[create send_multiple]
  before_action :set_recipient, only: :create

  def index
    @invites = current_player.invites_received
  end

  def unviewed
    @invites = current_player.invites_received.invites_new
    render :index
  end

  def update
    if invite.update(invite_params)
      redirect_to invites_path, notice: 'Invite accepted.'
    else
      render :index
    end
  end

  def create
    @invite = @game.invites.new(sender: current_player, recipient: @recipient)

    if @invite.save
      redirect_to game_path(@game), notice: "Invite sent to #{@recipient.email}"
    else
      render 'games/show' # проверить , что не отправляется дважды
    end
  end

  def destroy

  end

  private

  def invite_params
    params.require(:invite).permit(:accepted)
  end

  def find_invite
    @invite = Invite.find(params[:id])
  end

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