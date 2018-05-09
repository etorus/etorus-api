class MeditationSeedJob < ActiveJob::Base
  queue_as :default

  def perform(record)
    MeditationSeed.()
  end
end
