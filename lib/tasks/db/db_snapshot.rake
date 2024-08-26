# frozen_string_literal: true

namespace :db do
  desc 'Take a snapshot of the database'
  task snapshot: :environment do
    # Database configuration from database.yml
    config = Rails.configuration.database_configuration[Rails.env]

    # Extracting the necessary information
    database = config['database']

    # File name for the snapshot
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    filename = "db/snapshots/#{database}_snapshot_#{timestamp}.sql"

    # Ensure the snapshots directory exists
    FileUtils.mkdir_p(File.dirname(filename))

    # Command to take the snapshot
    command = "pg_dump -F c -b -v -f #{filename} #{database}"

    puts 'Taking snapshot of the database...'
    system(command)

    puts "Snapshot saved to #{filename}"
  end
end
