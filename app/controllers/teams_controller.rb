# Teams Controller
class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = current_user.teams.new(team_params)
    redirect_to boards_path if @team.save
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
