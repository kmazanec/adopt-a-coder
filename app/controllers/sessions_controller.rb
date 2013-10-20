class SessionsController < ApplicationController


  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      if current_user_candidate
        redirect_to edit_candidate_path(current_user)
      else
        redirect_to donor_path(current_user)
      end
    else
      flash[:error] = "Incorrect Email or Password"
      redirect_to root_path
    end

  end

  def logout
    session[:id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end




end


