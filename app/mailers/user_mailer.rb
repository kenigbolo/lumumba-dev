class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_us.subject
  #
  def contact_us(message)
    @message = message

    mail to: 'tribe@lumumba.com', from: message.email, subject: 'Message from Contact Us form'
  end

  def first_vote_notitfication(design)
    @design = design

    mail to: @design.user.email, from: 'notifications@lumumba.com', subject: 'You just got your first vote!'
  end
end
