# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/signup_confirmation
  def signup_confirmation
    WelcomeMailer.signup_confirmation
  end

end
