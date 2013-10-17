class Donation < ActiveRecord::Base
  belongs_to :donor
  belongs_to :campaign
  has_one :candidate, through: :campaign
end
