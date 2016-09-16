class UserMailer < ApplicationMailer
  default :from => "XXX@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_problem.subject
  #
  def notify_problem
    @greeting = "Hi"
    mail(:to => "XXX@yahoo.com.tw", :subject => "New Comment")
    #mail to: "to@example.org"
  end
end
