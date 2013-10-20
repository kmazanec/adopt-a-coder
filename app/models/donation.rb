class Donation < ActiveRecord::Base
  belongs_to :donor
  belongs_to :campaign
  has_one :candidate, through: :campaign

  validates :token, presence: true
  validates :token, uniqueness: true
  validates :amount, numericality: { :greater_than_or_equal_to => 10 }

  after_create :update_donations

  def update_donations
    campaign = Campaign.find(self.campaign_id)
    total = campaign.donations.sum(:amount)
    campaign.update_attributes(total: total)
  end

end
