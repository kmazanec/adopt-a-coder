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

  after_create :application_create

  def self.search(query)
    where("name like ?", "%#{query}%")
  end


  protected
  def application_create
    Application.create(candidate_id: self.id)
  end

end
