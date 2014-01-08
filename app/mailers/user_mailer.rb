class UserMailer < ActionMailer::Base
  # default from: "admin@contactcake.com"

  def send_message(user)
    @user = user
    mail from: user.email, to: 'pdornfel@gmail.com', subject: 'A user has submitted an inquiry'
  end

end
