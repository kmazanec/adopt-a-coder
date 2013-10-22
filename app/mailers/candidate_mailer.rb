class CandidateMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def candidate_mailer(candidate)
    @candidate = candidate
    @url = 'http://localhost:3000'
    delivery_options = { user_name: "adopt.a.coder@gmail.com",
                         password: "damnittravis",
                         address: "smtp.gmail.com" }
    mail(to: @candidate.email, subject: 'Welcome to Adopt.a.Coder.com',
      delivery_method_options: delivery_options)

  end
end
