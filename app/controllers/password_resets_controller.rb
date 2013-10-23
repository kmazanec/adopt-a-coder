class PasswordResetsController < ApplicationController
  def new
  end

  def create 
      user = User.find_by_email(params[:email])  
  user.send_password_reset if user  
  redirect_to root_url, :notice => "Email sent with   
    password reset instructions." 
  end

  def edit  
    # @user = User.find_by_password_reset_token!(params[:id]) 
    @user = User.new
    if User.find_by(password_reset_token: params[:token]).nil?
      redirect_to root_path, error: "Please try to reset password again, token was invalid."
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:token])  
    if @user.password_reset_sent_at < 2.hours.ago  
      redirect_to new_password_reset_path, :error => "Password    
        reset has expired."
    elsif @user.update_attributes(password: params[:password], password_confirmation: params[:password_confirmation])
      flash[:success] = "Password has been reset."
      redirect_to root_path  
    else
      flash[:error] = "Please try again"
      render :edit
    end  
  end  
end
