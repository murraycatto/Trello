class BoardsController < ApplicationController
  before_action  :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_boards

  def index
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

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
    def set_boards
      @boards = Board.where(user: current_user)
    end
    def set_board
      @board = Board.find(params[:id])
    end

    def set_boards
      @boards = Board.where(params[:id])
    end

    def board_params
      params.require(:board).permit(:name)
    end
end
