class BoardsController < ApplicationController
  before_action :setup_board, only: [:show]
  before_action :set_teams, only: [:index]
  before_action :authenticate_user!
  def index
  end

  def show
    if @board.user != current_user
      redirect_to board_path
    end
  end

  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        format.html { redirect_to boards_url}
      else
        format.html { render :index }
      end
    end
  end

  private
    def set_teams
      @teams = Team.includes(:boards).where(user: current_user)
    end

    def setup_board
      @board = Board.includes(:lists).find(params[:id])
    end

    def board_params
        {
          name: params.require(:board).permit(:name)['name'],
          user_id:current_user.id,
          color_id:Color.first.id,
          team_id:params.require(:board)[:team]
        }
    end
end
