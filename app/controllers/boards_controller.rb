class BoardsController < ApplicationController
  before_action :set_board, only: [:show,:updated,:destroy]
  before_action :set_boards, only: [:index, :show]
  before_action :authenticate_user!
  before_action :set_teams, only: [:index, :show]
  before_action :set_lists, only: [:show]
  def index
  end

  def show
    if @board.user != current_user
      redirect_to board_path
    end
  end

  def create
    @board = Board.new(params.require(:board).permit(:name))
    @board.user = current_user
    @board.color = Color.first
    @board.team = Team.find(params.require(:board)[:team])

    respond_to do |format|
      if @board.save
        format.html { redirect_to boards_url}
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_teams
      @teams = Team.where(user: current_user)
    end

    def set_boards
      @boards = Board.where(user: current_user)
    end

    def set_board
      @board = Board.find(params[:id])
    end

    def set_lists
      @lists = List.where(board:@board)
    end

end
