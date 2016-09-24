class UserMailer < ApplicationMailer
  #default :from => "tp632333846@gmail.com"
  default from: "nthulibrails@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_problem.subject
  #
  #def welcome_email
  #  @user = User.first
  #  mail(:to => @user.email, :subject => 'Welcome to use the system')
  #end
  def notify_problem
    @receiver = "tp6_3846@yahoo.com.tw"
    @another = "smluo@lib.nthu.edu.tw"
    @daily_problems = DailyProblem.where("created_at > ?", Time.now.beginning_of_day)
    mail(:to => @receiver, :cc => @another, :subject => "測試")
    #mail to: "to@example.org"
  end
end
