class UserMailer < ActionMailer::Base
  default from: "dbcadoptacoder@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    delivery_options = { user_name: "dbcadoptacoder@gmail.com",
                         password: "igeekallweek",
                         address: "smtp.gmail.com" }
    mail(to: @user.email, subject: "Password Reset", delivery_method_options: delivery_options)

  end
end
