# Boards Controller
class BoardsController < ApplicationController
  before_action :set_board, only: [:show]
  before_action :set_teams, only: [:index]
  before_action :authenticate_user!
  def index; end

  def show; end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_url
    else
      render :index
    end
  end

  private

  def set_teams
    @teams = Team.includes(:boards).where(user: current_user)
  end

  def set_board
    @board = Board.includes(:lists).find_by(id: params[:id], user: current_user)
    redirect_to boards_url if @board.nil?
  end

  def board_params
    {
      name: params.require(:board).permit(:name)['name'],
      user_id: current_user.id,
      color_id: Color.first.id,
      team_id: params.require(:board)[:team]
    }
  end
end
