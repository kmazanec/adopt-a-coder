class Response < ActiveRecord::Base
  belongs_to :application
  has_one :candidate, through: :application
  belongs_to :question

  validates_presence_of :body
end
