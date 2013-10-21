class DonorMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def welcome_email(donor)
    @donor = donor
    @url = 'http://localhost:3000'
    delivery_options = { user_name: "adopt.a.coder@gmail.com",
                         password: "damnittravis",
                         address: "smtp.gmail.com" }
    mail(to: @donor.email, subject: 'Welcome to Adopt.a.Coder.com',
       delivery_method_options: delivery_options)
  end
end
