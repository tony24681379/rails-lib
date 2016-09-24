class AutoMailerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    UserMailer.notify_problem.set(wait_until: Date.tomorrow.midnight).perform_later(record)
  end
end