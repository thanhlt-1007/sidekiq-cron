class HardWorker
  include Sidekiq::Worker

  def perform
    puts "HarkWorker is performing"
  end
end
