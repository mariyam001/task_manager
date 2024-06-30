class EmailReminderWorker
  include Sidekiq::Worker

  def perform
    Task.where(state: ["Backlog", "In-progress"]).each do |task|
      if task.deadline.between?(1.day.from_now.beginning_of_hour, 1.day.from_now.end_of_hour)
        TaskMailer.reminder_email(task.user, task).deliver_now
      end

      if task.deadline.between?(1.hour.from_now.beginning_of_minute, 1.hour.from_now.end_of_minute)
        TaskMailer.reminder_email(task.user, task).deliver_now
      end
    end
  end
end
