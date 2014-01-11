class UserInquiriesController < ApplicationController

  def new
    @user_inquiry = UserInquiry.new
  end

  def create
    if !user_signed_in?
      @user_inquiry = UserInquiry.new(user_params)
    else
      @user_inquiry = UserInquiry.new(user_params)
      @user_inquiry.first_name = current_user.first_name
      @user_inquiry.last_name = current_user.last_name
      @user_inquiry.email = current_user.email
    end
    if @user_inquiry.submit
      flash['success'] = "Your message has been sent"
      UserMailer.send_message(@user_inquiry)
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end
  end

  private

  def user_params
    params.require(:user_inquiry).permit(:email, :first_name, :last_name, :subject, :description)
  end

end