namespace :maintenance do
  desc "Send maintenance notification email to users"
  task notify: :environment do

    # Check for input argument
    if ARGV.empty?
      puts "Usage: rake maintenance:notify['YYYY-MM-DD HH:MM']"
      exit
    end

    input_time = ARGV[0]

    # Check for valid date and time format
    begin
      scheduled_time = Time.parse(input_time)
    rescue ArgumentError
      puts "Invalid date and time format. Please enter in 'YYYY-MM-DD HH:MM' format."
      exit
    end

    # Check for past date and time
    if scheduled_time < Time.now
      puts "Scheduled date and time cannot be in the past. Please enter a valid date."
      exit
    end

    # Send email to all users
    User.find_each do |user|
      if user.email.present?
        UserMailer.maintenance_email(user, scheduled_time).deliver_now
        puts "Email sent: #{user.email}"
      end
    end
  end
end
