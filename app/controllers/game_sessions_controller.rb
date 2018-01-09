class GameSessionsController < ApplicationController
	def index
		@game_sessions = GameSession.page params[:page]
	end
end
