class CreateGroupGames < ActiveRecord::Migration[5.1]
  def change
    create_table :group_games do |t|
      t.integer :bgg_game_id
      t.integer :game_group_id
      t.date :last_played

      t.timestamps
    end

    add_index :group_games, [:bgg_game_id, :game_group_id]
  end
end
