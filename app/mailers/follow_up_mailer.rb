class FollowUpMailer < ActionMailer::Base

  def send_follow_up(contact)
    @contact = contact
    mail from: 'admin@contactcake.com', to: contact.user.email, subject: 'Hello'
  end


end