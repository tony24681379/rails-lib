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
    @daily_problems = DailyProblem.where("date >= ?", Time.now.beginning_of_day)
    
    if @daily_problems.count == 0 
      return
    end
    
    @daily_problems.each do |daily_problem|
      if not daily_problem.comment.blank?
        daily_problem.situation = "已完成"
      end
      group = Machine.where("machine_id = ?", daily_problem.machine_id).first.maintain_group
      case group
      when 'Kiosk查詢平台'
        daily_problem.maintainer_id = '陳玉芬'
        #@another += ", yfchen@lib.nthu.edu.tw"
      when '非靠卡電腦'
        daily_problem.maintainer_id = '高見成'
        #@another += ", cckao@lib.nthu.edu.tw" 
      when '一般靠卡電腦'
        daily_problem.maintainer_id = '高見成'
        #@another += ", cckao@lib.nthu.edu.tw"
      when '預約靠卡電腦'
        daily_problem.maintainer_id = '高見成'
        #@another += ", cckao@lib.nthu.edu.tw"
      when '多媒體設備'
        daily_problem.maintainer_id = '黃美惠'
        #@another += ", mhhuang@lib.nthu.edu.tw"
      end
      
    end
    mail(:to => @receiver, :cc => @another, :subject => "巡檢系統通知測試")
  end
end