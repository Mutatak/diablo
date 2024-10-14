class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def maintenance_email(user, scheduled_time)
    @user = user
    @scheduled_time = scheduled_time
    mail(to: @user.email, subject: 'Scheduled Maintenance Notification')
  end

  def send_excel_file(file_path)
    attachments['confirm_status.xlsx'] = File.read(file_path)
    mail(to: 'mustafa@foo.com', subject: 'Daily Confirm Status of Users')
  end
end
