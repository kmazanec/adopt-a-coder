module ApplicationHelper

  def current_campaign
    @current_campaign ||= Campaign.find(1)
  end

end
