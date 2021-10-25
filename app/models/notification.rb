class Notification < ApplicationRecord
  belongs_to :recepient, class_name: "Player", foreign_key: "recepient_id"
  belongs_to :game

  validates :body, presence: true

  scope :viewed,    -> { where(viewed: true)  }
  scope :unviewed,  -> { where(viewed: false) }

  def mark_read!(ids)
    Notification.find(params[:ids])
    @notifications.update_all(viewed: true)
  end
end