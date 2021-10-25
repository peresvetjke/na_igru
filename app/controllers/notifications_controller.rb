class NotificationsController < ApplicationController
  before_action :find_player, only: %i[index create]

  def index
    @notifications = @player.notifications
  end

  def show

  end

  def create
    #NotificationSender.new(current_player, )
    @notification = current_player.notifications.create!(notification_params)
    
    redirect_to root_path, notice: "Notification sent"
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_player
    @player = Player.find(params[:player_id])
  end

  def find_notification
    @notification = Notification.find(params[:id])
  end
  
  def norification_params
    params.require(:notification).permit(:body)
  end
end
