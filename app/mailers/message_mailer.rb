class MessageMailer < ApplicationMailer

  def notify(message)
    @user = User.find message.receiver
    mail(to: @user.email,
    subject: message.subject,
    body: message.body)
  end
end
