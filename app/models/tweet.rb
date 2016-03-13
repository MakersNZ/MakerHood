class Tweet < ActiveRecord::Base
  acts_as_taggable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :votes

  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :tweet_id => id)
      increment!(:votes_up)
      Vote.create(:ip => ip, :tweet_id => id)
    end
  end

  def safe_data
    OpenStruct.new(data)
  end

  def youtube
    safe_data.to_s.include?("youtu")
  end

  # Called by the elasticsearch indexer and should add the tag names
  def as_indexed_json(options={})
    as_json(include: { tags: { only: :name } } )
  end

  # Work out the virality of this tweet
  def calculate_hot_score
    # sign of the score
    s = 1 if votes_up > 0
    s = 0 if votes_up == 0
    s = -1 if votes_up < 0

    # absolute value of the score
    if s >= 1
      x = s
    else
      x = 1
    end

    # seconds between submission time and midnight of the day makerhood started.
    t = created_at - Time.new(2015, 1, 1, 12, 00, 0)
  end
end
