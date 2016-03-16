#
# Generic social assets, should be taggable and scorable
# Requires a votes_up column
#

module SocialAsset
  extend ActiveSupport::Concern

  included do
    has_many :votes
  end

  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :tweet_id => id)
      increment!(:votes_up)
      Vote.create(:ip => ip, :tweet_id => id)
    end
  end

  def safe_data
    OpenStruct.new(data)
  end

  # Work out the virality of this social asset
  def hot_score
    # sign of the score
    if votes_up >  0
      s = 1.0
    elsif votes_up == 0
      s = 0.0
    else
      s = -1.0
    end
    # absolute value of the score
    if votes_up >= 1
      x = votes_up
    else
      x = 1.0
    end

    # seconds between submission time and midnight, new years day, 2015
    t = created_at - Time.new(2015, 1, 1, 12, 00, 0)

    Math.log10(x) + ( (s * t) / 45000.0 )
  end

  # Called by the elasticsearch indexer and should add the tag names
  def as_indexed_json(options={})
    as_json(include: { tags: { only: :name } }, methods: :hot_score)
  end

end
