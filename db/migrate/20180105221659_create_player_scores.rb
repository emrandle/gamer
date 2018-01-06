class CreatePlayerScores < ActiveRecord::Migration[5.1]
  def change
    create_table :player_scores do |t|
    	t.integer			:game_session_id
    	t.integer			:player_id
    	t.integer			:score

      t.timestamps
    end
  end
end
