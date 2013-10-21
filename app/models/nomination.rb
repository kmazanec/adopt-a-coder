class Nomination < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :candidate
  belongs_to :donor

  validates_presence_of :campaign
  validates_presence_of :candidate
  validates_presence_of :donor

end
