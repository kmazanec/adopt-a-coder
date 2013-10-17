class Candidate < User
  has_one :application
  has_many :responses, through: :application

  has_many :nominations

end