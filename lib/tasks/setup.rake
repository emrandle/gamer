require 'csv'

namespace :gamer do
	desc 'Add in the base players'
	task :base_setup => :environment do
		game_group = GameGroup.create(name: 'Beginners Mind')

		mike = Player.create(first_name: 'Mike', last_name: 'Randle', nick_name: 'Wile E', group_id: game_group.id)
		mel = Player.create(first_name: 'Melvin', last_name: 'Mallard', nick_name: 'Mely Mel', group_id: game_group.id)
		keith = Player.create(first_name: 'Keith', last_name: 'Dixon', nick_name: 'KD', group_id: game_group.id)
		darius = Player.create(first_name: 'Darius', last_name: 'Carter', nick_name: 'DC', group_id: game_group.id)
		ali = Player.create(first_name: 'Ali', last_name: 'Powell', nick_name: 'AP', group_id: game_group.id)

		CSV.foreach('db/games.csv', headers: true) do |row|
debugger
			gs = GameSession.create(game_date: row['Date'], name: row['GameName'], bgg_id: row['GameID'])
			gs.player_scores.create([
				{player_id: mike.id, score: row['MikeScore']},
				{player_id: mel.id, score: row['MelScore']},
				{player_id: keith.id, score: row['KeithScore']},
				{player_id: darius.id, score: row['DariusScore']},
				{player_id: ali.id, score: row['AliScore']}
			])

			puts "#{row['Date']}, #{row['GameName']}, Mike: #{row['MikeScore']}, Mel: #{row['MelScore']}, Keith: #{row['KeithScore']}, Darius: #{row['DariusScore']}, Ali: #{row['AliScore']}"
		end
	end
end
