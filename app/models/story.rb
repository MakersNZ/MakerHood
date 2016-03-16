class Story < ActiveRecord::Base
  acts_as_taggable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  include SocialAsset

end
