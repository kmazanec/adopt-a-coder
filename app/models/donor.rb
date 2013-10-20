class Donor < User
  has_many :donations
  has_many :campaigns, through: :donations

  has_many :nominations

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  validates :password, presence: true, :on => :create

  include ApplicationHelper

  def nomination_available?
    Nomination.find_by(campaign_id: current_campaign, donor_id: self.id).nil?
  end

  def current_campaign_donation?
    self.donations.where(campaign_id: current_campaign).any?
  end

end
