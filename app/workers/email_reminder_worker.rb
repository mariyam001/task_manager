class EmailReminderWorker
  include Sidekiq::Worker

  def perform
    Task.all.each do |task|

      if task.deadline.strftime('%m %d %y') == 1.day.from_now.strftime('%m %d %y') && check_time(task.deadline)
        TaskMailer.reminder_email(task).deliver_now
      end

      if task.deadline <= 1.hour.from_now && task.deadline > Time.now
        TaskMailer.reminder_email(task).deliver_now
      end
    end
  end

  private
    def check_time(deadline)
      (deadline.strftime('%H:%M') > (Time.now.utc-1.hour).strftime('%H:%M') && deadline.strftime('%H:%M')< (Time.now.utc+1.hour).strftime('%H:%M'))
    end
end
