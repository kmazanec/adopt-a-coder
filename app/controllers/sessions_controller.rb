class SessionsController < ApplicationController

  def logout
    session[:id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to root_path
  end

end
