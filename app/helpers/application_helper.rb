module ApplicationHelper

  def current_campaign
    @current_campaign ||= Campaign.includes(:candidate).find(1)
  end

  def recent_donations
    @recent_donations ||= Donation.includes(:donor).order("id DESC").limit(10)
  end

  def past_campaigns
    @past_campaigns ||= Campaign.includes(:candidate).order("id DESC").limit(10)
  end

end
