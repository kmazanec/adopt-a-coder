module ApplicationHelper

  def current_campaign
    @current_campaign ||= Campaign.includes(:candidate).find(1)
  end

end
