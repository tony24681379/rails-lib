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
    #@another2 = "lovemeimeicat@gmail.com"
    @daily_problems = DailyProblem.where("date > ?", Time.now.beginning_of_day)
    mail(:to => @receiver, :cc => @another, :subject => "巡檢系統通知測試")
  end
end