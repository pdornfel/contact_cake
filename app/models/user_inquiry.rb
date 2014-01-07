class UserInquiry < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :subject
  validates_presence_of :description



  def submit
    if save
      UserMailer.send_message(self).deliver
      return true
    end
  end
end
