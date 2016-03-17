class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.string   "instagram_id"
      t.jsonb    "data"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.integer  "votes_up",   default: 0
    end
  end
end
