Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:6379/0", password: "Aa@123456" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:6379/0", password: "Aa@123456" }

  schedule_file = "config/schedule.yml"
  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end
