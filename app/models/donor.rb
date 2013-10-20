class Donor < User
  has_many :donations
  has_many :campaigns, through: :donations

  has_many :nominations

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  validates :password, presence: true, :on => :create

  def nomination_available?
    Nomination.find_by(campaign_id: current_campaign, donor_id: self.id).nil?
  end

end
