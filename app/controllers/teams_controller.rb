class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = Team.new(team_params)
    @team.user = current_user
    respond_to do |format|
      if @team.save
        format.html { redirect_to boards_path, notice: 'Team was successfully created.' }
      end
    end
  end


  private

    def team_params
      params.require(:team).permit(:name)
    end
end
