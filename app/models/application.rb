class Application < ActiveRecord::Base
  belongs_to :candidate
  has_many :responses
  has_many :questions, through: :responses
  
end
