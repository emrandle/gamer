class GameGroupsController < ApplicationController
  def index
  	@game_groups = GameGroup.all
  end

  def show
  	@year = params[:yr].nil? ? 2017 : params[:yr]
  	@game_group = GameGroup.find_by id: params[:id]
  end
end
