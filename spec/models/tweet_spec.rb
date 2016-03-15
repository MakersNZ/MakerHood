require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:t) { Tweet.create! }

  describe 'json index' do
    let(:valid_json) do
      {
        "id"=>t.id, "tweet_id"=>nil, "data"=>nil, "created_at"=>t.created_at, "updated_at"=>t.updated_at, "votes_up"=>t.votes_up, "hot_score"=>0.0, "tags"=>[]
      }
    end

    it 'returns' do
      r = t.as_indexed_json
      expect(r).to eq(valid_json)
    end
  end

  describe 'hot score' do
    it 'returns 0.0 on new' do
      r = t.hot_score

      expect(r).to eq(0.0)
    end

    it 'changes with votes' do
      t.vote!("127.0.0.1")
      t.vote!("127.0.0.2")
      t.vote!("127.0.0.3")
      t.vote!("127.0.0.4")
      r = t.hot_score

      expect(r).not_to eq(0.0)
    end
  end
end
