class CreateGameGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :game_groups do |t|
    	t.string		:name
    	t.integer		:owner_id

      t.timestamps
    end
  end
end
