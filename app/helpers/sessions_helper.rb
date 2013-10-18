module SessionsHelper
  def current_user
    # session[:id] = 1 # DONOR
    # session[:id] = 2 # CANDIDATE
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    ! current_user.nil?
  end

  def current_user_candidate
    current_user.class == Candidate
  end

  def current_user_donor
    current_user.class == Donor
  end



end
