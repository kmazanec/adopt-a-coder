class DonorMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def welcome_email(donor)
    @donor = donor

    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: @donor.email, subject: 'Welcome to Adopt.a.Coder.com',
       delivery_method_options: delivery_options)
  end

  def donation_mailer(donor)
    @donor = donor
    @current_campagin = Campaign.current_campaign

    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: @donor.email, subject: 'Thank you for Donating',
      delivery_method_options: delivery_options)

  end
end
