class CreateGameSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :game_sessions do |t|
    	t.date		:game_date
    	t.string	:name
    	t.integer	:bgg_id

      t.timestamps
    end
  end
end
