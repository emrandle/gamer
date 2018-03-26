class CreateBggGames < ActiveRecord::Migration[5.1]
  def change
    create_table :bgg_games do |t|
    	t.integer :bgg_id
    	t.integer :rank
    	t.string  :bgg_name
    	t.string  :year_published
    	t.string  :thumbnail

    	t.timestamps
    end
  end
end
