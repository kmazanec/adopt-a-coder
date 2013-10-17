module ApplicationHelper

  def current_campaign
    @current_campaign ||= Campaign.find(1)
  end

  def current_campaign_candidate


  end

end
