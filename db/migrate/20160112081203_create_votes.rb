class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :user_id,   null: false
      t.integer  :survey_id, null: false
      t.integer  :vote_type,     null: false

      t.timestamps null: false
    end
    add_index :votes, [:user_id, :survey_id]
  end
end
