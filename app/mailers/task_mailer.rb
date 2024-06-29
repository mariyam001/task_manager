class TaskMailer < ApplicationMailer
	default from: 'mariyamkauser2@gmail.com'

	def reminder_email(task)
		@user = task.user
		@task = task
		mail(to: @user.email, subject: 'Task Deadline Reminder')
	end

end
