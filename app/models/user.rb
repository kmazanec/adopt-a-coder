class User < ActiveRecord::Base
  has_secure_password


  has_many :media


  has_many :photos
  has_many :videos



end
