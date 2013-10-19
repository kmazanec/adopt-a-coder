module SessionsHelper
  def current_user

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

  def current_application
    @application ||= Application.includes(:candidate, :responses).find_by(candidate_id: session[:id])
  end

end
