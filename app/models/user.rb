class User < ActiveRecord::Base
  has_secure_password


  has_many :media


  has_many :images
  has_many :videos

  has_one :profile_video, class_name: "Video"
  has_one :profile_image, class_name: "Image"

  after_create :set_default_image


  def set_default_image
    self.profile_image = Image.find(1) unless self.profile_image
    self.save
  end





end
