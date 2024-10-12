class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def maintenance_email(user, scheduled_time)
    @user = user
    @scheduled_time = scheduled_time
    mail(to: @user.email, subject: 'Scheduled Maintenance Notification')
  end
end
