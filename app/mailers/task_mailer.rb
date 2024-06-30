class TaskMailer < ApplicationMailer
	default from: 'app@gmail.com'
	def reminder_email(task)
		@user = task.user
		@task = task
		mail(to: @user.email, subject: "#{task.title} Deadline Reminder")
	end
end
