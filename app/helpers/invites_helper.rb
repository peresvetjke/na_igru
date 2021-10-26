module InvitesHelper

  def invite_status(invite)
    return "Waiting for response" if invite.accepted.nil?
    invite.accepted ? "Accepted" : "Declined"
  end
end