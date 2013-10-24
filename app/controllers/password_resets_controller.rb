class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:notice] = "Email sent with password reset instructions."
    redirect_to root_url
  end

  def edit
    if User.find_by(password_reset_token: params[:token]).nil?
      flash[:error] = "Please try to reset password again, token was invalid."
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:token])
    if @user
      if @user.password_reset_sent_at < 2.hours.ago
        flash[:error] = "Password reset has expired."
        redirect_to password_resets_path
      else @user.update_attributes(password: params[:password], password_confirmation: params[:password_confirmation])
        flash[:success] = "Password has been reset."
        redirect_to root_path
      end
    else
      flash[:error] = "Please try to reset password again, token was invalid."
      redirect_to root_path
    end
  end
end

