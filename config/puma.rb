threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

environment ENV.fetch("RAILS_ENV") { "production" }

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Soket ile Puma'yı başlatmak için
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# PID ve State dosyaları
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

activate_control_app
