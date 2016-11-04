# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/contact_us
  def contact_us
    UserMailer.contact_us SecureRandom.hex
  end

  def first_vote_notification
    UserMailer.first_vote_notification SecureRandom.hex
  end

end
