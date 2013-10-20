namespace :db do
  desc 'Create sample data'
  task sample_data: :environment do
    load Rails.root.join 'db', 'sample_data.rb'
  end

  desc 'Seed and sample DB'
  task bootstrap: [:drop, :seed, :sample_data]
end
