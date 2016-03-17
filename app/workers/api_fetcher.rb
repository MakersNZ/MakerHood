class ApiFetcher
  include Sidekiq::Worker
  sidekiq_options unique: :until_timeout, unique_expiration: 1 * 60 # 2 hours

  def perform(query)
    do_twitter(query)
    do_instagram(query)
  end


  def do_instagram query
    response = RestClient.get("https://api.instagram.com/v1/tags/makerhood/media/recent.json", params: { access_token: ENV['instagram_access_token'] })
    results = JSON.parse(response)["data"]

    puts "Instagrams: #{results.length}"

    results.each do |r|
      print 'I'
      puts r.inspect
      r = OpenStruct.new(r)

      i = Instagram.find_or_initialize_by(instagram_id: r.id)
      i.data = r.to_json

      r.tags.each do |hashtag|
        i.tag_list.add(hashtag)
      end

      i.save!
    end
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
