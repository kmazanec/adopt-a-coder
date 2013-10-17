class Donor < User
  has_many :donations
  has_many :campaigns, through: :donations

  has_many :nominations

end