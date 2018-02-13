class GameGroup < ApplicationRecord
  has_many :game_sessions
  has_many :players

  def num_of_sessions
  	game_sessions.count
  end

  def sessions_for_year(year)
  	results = []

  	game_sessions.each do |session|
  		results << session if session.game_date.year.eql?(year.to_i)
  	end

  	results
  end

  def sessions_for(year,player)
  	results = []

		sessions_for_year(year).each do |session|
			results << session if session.players.include?(player)
		end

		results
  end

  def wins_for(year,player)
    wins = []

    sessions_for(year,player).each do |session|
      wins << session if session.winner.eql?(player)
    end

    wins
  end

  def game_totals(year)
    
  end
end
