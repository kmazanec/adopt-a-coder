class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def password_generator
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...50).map{ o[rand(o.length)] }.join
  end
  

  include SessionsHelper


end
