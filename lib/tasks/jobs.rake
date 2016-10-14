# encoding: utf-8

#namespace :Tasks do
#    desc "定期發送email" #此處可自行輸入task的描述

#    task :AutoSend => :environment do
#        UserMailer.notify_problem.deliver_now
#    end
#end

desc 'send routine email'
task send_routine_email: :environment do
  # ... set options if any
  UserMailer.notify_problem
end