class GameSessionsController < ApplicationController
	def index
		@game_sessions = GameSession.all
	end
end
