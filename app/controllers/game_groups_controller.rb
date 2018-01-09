class GameGroupsController < ApplicationController
  def index
  	@game_groups = GameGroup.all
  end

  def show
  	@game_group = GameGroup.find_by id: params[:id]
  end
end
