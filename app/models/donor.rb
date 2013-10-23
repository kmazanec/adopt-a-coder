class Donor < User
  has_many :donations
  has_many :campaigns, through: :donations

  has_many :nominations

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  validates :password, presence: true, :on => :create

  def nomination_available?
    cur_id = Campaign.current_campaign.id
    dons = self.donations.pluck(:campaign_id)
    noms = self.nominations.pluck(:campaign_id)
    return false if dons.empty?
    dons.last == cur_id && (noms.last.nil? || noms.last < cur_id)
  end

  def current_campaign_donation?
    self.donations.where(campaign_id: Campaign.current_campaign.id).any?
  end

end


