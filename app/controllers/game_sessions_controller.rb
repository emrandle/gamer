class GameSessionsController < ApplicationController
	def index
		@game_sessions = GameSession.page params[:page]
	end

	def new
		@game_session = GameSession.new
	end
end
