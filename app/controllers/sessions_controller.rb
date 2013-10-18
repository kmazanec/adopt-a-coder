class SessionsController < ApplicationController

  def logout
    session[:id] = nil
    redirect_to root_path
  end

end