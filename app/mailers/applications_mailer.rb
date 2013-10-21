class ApplicationsMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def applications_mailer(application)
    @application = application
    @url = 'http://localhost:3000'
    delivery_options = { user_name: "adopt.a.coder@gmail.com",
                         password: "damnittravis",
                         address: "smtp.gmail.com" }
    mail(to: "adopt.a.coder@gmail.com", subject: 'A New Application Submitted',
      delivery_method_options: delivery_options)

  end
end