class User < ActiveRecord::Base
  has_secure_password


  has_many :media


  has_many :images
  has_many :videos

  has_one :profile_video, class_name: "Video"
  has_one :profile_image, class_name: "Image"


end
