class Media < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url
  validates_presence_of :url
end
