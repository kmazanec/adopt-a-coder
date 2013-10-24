class DonationMailer < ActionMailer::Base
  default from: "dbcadoptacoder@gmail.com"

    def existing_donor_mailer(donor, candidate, donation)
    @donation = donation
    @candidate = candidate
    @donor = donor
    @url = 'http://localhost:3000/candidates'

    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: @donor.email, subject: 'Thank You For Donating',
      delivery_method_options: delivery_options)
  end
end
