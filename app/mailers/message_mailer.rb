class MessageMailer < ApplicationMailer

  def notify(message)
    @content = message
    @user = User.find message.receiver
    @url = "https://alumni.mmu.edu.my"
    mail(to: @user.email)
  end

  def welcome(user, password)
    @user = user
    @password = password
    @url = "https://alumni.mmu.edu.my"
    mail(to: @user.email)
  end
end
