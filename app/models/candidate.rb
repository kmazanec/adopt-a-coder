class Candidate < User
  has_one :application
  has_many :responses, through: :application

  has_many :nominations
  validates :phone, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :address1, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/
end
