class Campaign < ActiveRecord::Base
  belongs_to :candidate
  has_many :donations
  has_many :donors, through: :donations
  
  has_many :nominations
end
