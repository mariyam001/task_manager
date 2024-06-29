class EmailReminderWorker
  include Sidekiq::Worker

  def perform
    Task.all.each do |task|
    	binding.pry
      next if task.state != "Done"

      if task.deadline <= 1.day.from_now && task.deadline > Time.now
        TaskMailer.reminder_email(task.user, task).deliver_now
      end

      if task.deadline <= 1.hour.from_now && task.deadline > Time.now
        TaskMailer.reminder_email(task.user, task).deliver_now
      end
    end
  end
end

