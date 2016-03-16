class ApiFetcher
  include Sidekiq::Worker
  sidekiq_options unique: :until_timeout, unique_expiration: 1 * 60 # 2 hours

  def perform(query)
    do_twitter(query)
    do_instagram(query)
  end



  private


  def do_instagram query

  end

  def do_twitter query
    @twitter ||= Twitter::REST::Client.new do |config|
     config.consumer_key        = ENV["twitter_consumer_key"]
     config.consumer_secret     = ENV["twitter_consumer_secret"]
     config.access_token        = ENV["twitter_access_token"]
     config.access_token_secret = ENV["twitter_access_token_secret"]
    end

    @twitter_results = Rails.cache.fetch(query, :expires_in => 10.minutes) do
      @twitter.search("#{query} -rt", result_type: "recent").take(100)
    end

    puts "Tweets: #{@twitter_results.length}"

    @twitter_results.each do |tr|
      print 'T'

      t = Tweet.find_or_initialize_by(tweet_id: tr.id)
      t.data = tr.to_json

      tr.hashtags.each do |hashtag|
        t.tag_list.add(hashtag.text)
      end
      t.save!
    end
  end
end
