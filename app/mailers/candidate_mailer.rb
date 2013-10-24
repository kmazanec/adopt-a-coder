class CandidateMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def candidate_mailer(candidate)
    @candidate = candidate

    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: @candidate.email, subject: 'Welcome to Adopt.a.Coder.com',
      delivery_method_options: delivery_options)

  end
end
