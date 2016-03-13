require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it 'has a hot score' do
    t = Tweet.create!
  end
end
