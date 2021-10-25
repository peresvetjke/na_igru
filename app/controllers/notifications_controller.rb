class NotificationsController < ApplicationController

  def index
    @notifications = current_player.notifications
  end

  def unviewed
    @notifications = current_player.notifications.unviewed
    render :index
  end

  def mark_as_read
    @notifications = Notification.find(params[:ids])
    @notifications.each { |n| n.update_column(:viewed, true) }
    redirect_to player_notifications_path(current_player), notice: "Notifications marked as read"
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
