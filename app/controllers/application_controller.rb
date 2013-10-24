class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def password_generator
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...50).map{ o[rand(o.length)] }.join
   end


  include SessionsHelper
  include ApplicationHelper

  def require_candidate_login
    unless current_user && current_user_candidate
      flash[:error] = "Please log in or sign up in order to view that page."
      redirect_to root_url
    end
  end  

  def require_donor_login
    unless current_user && current_user_donor
      flash[:error] = "Please log in or sign up in order to view that page."
      redirect_to root_url
    end
  end


end
