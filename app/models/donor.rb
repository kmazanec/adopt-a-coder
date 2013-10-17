class Donor < User
  has_many :donations
  has_many :campaigns, through: :donations

  has_many :nominations

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  validates :password, presence: true, :on => :create
end
