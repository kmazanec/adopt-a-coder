class Candidate < User
  has_one :application
  has_many :responses, through: :application

  has_many :nominations


  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  after_create :application_create

  def self.search(query)
    all(conditions: ["LOWER(name) like ?", "%#{query}%".downcase])
  end

  def profile_complete?

  end

  protected
  def application_create
    Application.create(candidate_id: self.id)
  end

end
