class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = current_user.teams.new(team_params)
    if @team.save
      redirect_to boards_path, notice: 'Team was successfully created.'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
