class WelcomeMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: @user.email, from: 'welcome@lumumba.com', subject: 'Welcome to Lumumba'
  end
end
