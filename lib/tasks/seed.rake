namespace :meditation do
  desc "Create the first sessions"

  task seed: :environment do
    beginning_seed = DateTime.now.beginning_of_day
    end_seed = (DateTime.now + 30.days).end_of_day

    MeditationSeed.(beginning_seed: beginning_seed, end_seed: end_seed)
  end
end
