class User < ActiveRecord::Base
  has_secure_password


  has_many :media


  has_many :images
  has_many :videos

  belongs_to :profile_video, class_name: Video, foreign_key: :profile_video_id
  belongs_to :profile_image, class_name: Image, foreign_key: :profile_photo_id

  after_create :set_default_image


  def set_default_image
    self.profile_image = Image.first unless self.profile_image
    self.save
  end


  def send_password_reset
    self.password_reset_token = generate_token
    self.password_reset_sent_at = Time.zone.now
    self.save!
    UserMailer.password_reset(self).deliver
  end

   def send_password_set
    self.password_reset_token = generate_token
    self.password_reset_sent_at = Time.zone.now
    self.save!
    DonorMailer.donation_mailer(self).deliver
  end

  private

  def generate_token
    SecureRandom.urlsafe_base64
  end


end
