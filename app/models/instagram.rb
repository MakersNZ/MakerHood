class Instagram < ActiveRecord::Base
  acts_as_taggable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  include SocialAsset

  def youtube
    safe_data.to_s.include?("youtu")
  end
end
