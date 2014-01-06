class UserInquiriesController < ApplicationController

  def new
    @user_inquiry = UserInquiry.new
  end

  def create
    @user_inquiry = UserInquiry.new(user_params)

    if @user_inquiry.save
      flash['success'] = "Your message has been sent"
      # ContactMailer.send_message(@contact)
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user_inquiry).permit(:email, :first_name, :last_name, :subject, :description)
  end

end