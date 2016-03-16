class AddVotesUpToStories < ActiveRecord::Migration
  def change
    add_column :stories, :votes_up, :integer, default: 0
  end
end
