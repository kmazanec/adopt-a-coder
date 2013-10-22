module ApplicationHelper

  def current_campaign
    @current_campaign ||= Campaign.current_campaign
  end

  def recent_donations
    @recent_donations ||= Donation.includes(:donor).order("id DESC").limit(8)
  end

  def past_campaigns
    @past_campaigns ||= Campaign.includes(:candidate).order("id DESC").limit(3)
  end

  def current_campaign_percentage
    @current_campaign_percentage ||= Campaign.current_campaign_percentage
  end



end
