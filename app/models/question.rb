class Question < ActiveRecord::Base
  has_many :responses
  validates_uniqueness_of :body
  validates_presence_of :body
end
