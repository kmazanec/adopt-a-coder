class Campaign < ActiveRecord::Base
  belongs_to :candidate
  has_many :donations
  has_many :donors, through: :donations

  has_many :nominations
  validates :goal, :end_date, :start_date, presence: true

  def total_donations
    self.donations.sum(:amount)
  end

  def self.current_campaign
    Campaign.find_by(current_campaign: true)
  end

  def self.current_campaign_percentage
    cur_campaign = self.current_campaign
    cur_campaign.total/cur_campaign.goal.to_f*100
  end


end
