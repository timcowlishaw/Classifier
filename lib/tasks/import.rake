namespace :import do
  task :feeds => :environment do
    Feed.import_all_from_yaml
  end
end