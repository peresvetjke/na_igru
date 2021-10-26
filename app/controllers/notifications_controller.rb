class NotificationsController < ApplicationController
  respond_to :html, :json

  def index
    @notifications = current_player.notifications
    respond_with @notifications
  end

  def unviewed
    @notifications = current_player.notifications.unviewed
    respond_with @notifications do |format|
      format.html {render :index}
    end
    # render :index
  end

  def mark_all_as_read
    notifications_ids = current_player.notifications.unviewed.pluck(:id)
    Notification.mark_read!(notifications_ids)    
    redirect_to notifications_path, notice: "All notifications marked as read"
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
end
