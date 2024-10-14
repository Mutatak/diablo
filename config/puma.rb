if ENV.fetch('RAILS_ENV') == 'production'
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
else
  max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
  min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
  threads min_threads_count, max_threads_count
  worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'
  port ENV.fetch('PORT') { 3000 }
  environment ENV.fetch('RAILS_ENV') { 'development' }
  pidfile ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }
  # workers ENV.fetch("WEB_CONCURRENCY") { 2 }
  # preload_app!
  plugin :tmp_restart
end
