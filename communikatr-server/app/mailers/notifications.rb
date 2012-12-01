class Notifications < ActionMailer::Base
  default from: "cgoodmac@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.email.subject
  #
  def email(email, message)
    @email = email
    @message = message

    mail to: "#{@email}", :subject => "You have a message from Communikatr"
  end
end
