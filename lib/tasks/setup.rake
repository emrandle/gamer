require 'csv'

namespace :gamer do
	desc 'Add in the base players'
	task :base_setup => :environment do
		GameGroup.delete_all
		Player.delete_all
		GameSession.delete_all
		PlayerScore.delete_all

		game_group = GameGroup.create(name: 'Beginners Mind')

		mike = Player.create(first_name: 'Mike', last_name: 'Randle', nick_name: 'Wile E', game_group_id: game_group.id)
		mel = Player.create(first_name: 'Melvin', last_name: 'Mallard', nick_name: 'Mely Mel', game_group_id: game_group.id)
		keith = Player.create(first_name: 'Keith', last_name: 'Dixon', nick_name: 'KD', game_group_id: game_group.id)
		darius = Player.create(first_name: 'Darius', last_name: 'Carter', nick_name: 'DC', game_group_id: game_group.id)
		ali = Player.create(first_name: 'Ali', last_name: 'Powell', nick_name: 'AP', game_group_id: game_group.id)

		CSV.foreach('db/games.csv', headers: true) do |row|
			gs = GameSession.create(game_date: row['Date'], name: row['GameName'], bgg_id: row['GameID'], game_group_id: game_group.id)
			gs.player_scores.create({player_id: mike.id, score: row['MikeScore']}) unless row['MikeScore'].nil?
			gs.player_scores.create({player_id: mel.id, score: row['MelScore']}) unless row['MelScore'].nil?
			gs.player_scores.create({player_id: keith.id, score: row['KeithScore']}) unless row['KeithScore'].nil?
			gs.player_scores.create({player_id: darius.id, score: row['DariusScore']}) unless row['DariusScore'].nil?
			gs.player_scores.create({player_id: ali.id, score: row['AliScore']}) unless row['AliScore'].nil?

			puts "#{row['Date']}, #{row['GameName']}, Mike: #{row['MikeScore']}, Mel: #{row['MelScore']}, Keith: #{row['KeithScore']}, Darius: #{row['DariusScore']}, Ali: #{row['AliScore']}"
		end
	end
end
