class BoardsController < ApplicationController
  before_action :set_board, only: [:show,:updated,:destroy]
  before_action :set_boards, only: [:index, :show]

  before_action :authenticate_user!
  before_action :set_teams, only: [:index, :show]

  def index
  end

  def show
  end



  def create
    @board = Board.new(board_params)
    @board.user = current_user
    @board.color = Color.first

    @board.project = Project.find(params.require(:board)[:project])
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
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
      @board = Board.where(id: params[:id], user: current_user)
    end

    def board_params
      params.require(:board).permit(:name)
    end
end
