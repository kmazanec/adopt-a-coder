class Nomination < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :candidate
  belongs_to :donor
end
