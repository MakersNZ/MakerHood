require 'elasticsearch/rails/tasks/import'


task :refresh_es => :environment do
  # bring in new content
  Rake::Task["suck_in"].invoke
  
  [ Tweet, Story ].each do |entity|
    entity.__elasticsearch__.client.indices.delete index: entity.index_name rescue nil
    entity.__elasticsearch__.create_index! force: true
    entity.__elasticsearch__.refresh_index!
    entity.import
  end
end

task :suck_in => :environment do
  # bring in new content
  ApiFetcher.perform_async("#makerhood")
end
