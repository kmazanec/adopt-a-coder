class Response < ActiveRecord::Base
  belongs_to :application
  has_one :candidate, through: :application
  belongs_to :question


  def complete?
    self.body.length > 9
  end

end
