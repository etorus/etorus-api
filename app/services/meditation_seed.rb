class MeditationSeed
  # (1.to_f / 24 / 2) = each 30 minutes
  STEP = 0.020833333333333332

  def initialize(beginning_seed, end_seed)
    @beginning_seed = beginning_seed
    @end_seed = end_seed
  end

  def self.call(beginning_seed:, end_seed:)
    new(beginning_seed, end_seed).seed
  end

  def seed
    ActiveRecord::Base.transaction do
      beginning_seed.step(end_seed, STEP).map do |start|
        create_meditation(start)
      end
    end
  end

  private
  attr_reader :beginning_seed, :end_seed

  def create_meditation(start)
    title = "Session #{start.strftime('%d/%m/%Y - %H:%M:%S')}"

    Meditation.create(
      user: User.first,
      title: title,
      audio: 'meditation_for_life',
      start: start
    )
  end
end
