class ApplicationsMailer < ActionMailer::Base
  default from: "adopt.a.coder@gmail.com"

  def applications_mailer(application)
    @application = application

    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: "adopt.a.coder@gmail.com", subject: 'A New Application Submitted',
      delivery_method_options: delivery_options)

  end
end
