namespace :import do
  task :feeds => :environment do
    Feed.import_all_from_yaml
  end
  
  task :categories => :environment do
    Category.import_all_from_yaml
  end
  
  task :message => :environment do
    Feed.update_all!
  end
end