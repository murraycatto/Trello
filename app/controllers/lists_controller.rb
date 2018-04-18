class ListsController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@list.board) }
      else
        format.html { redirect_to boards_path }
      end
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list
    else
      redirect_to root_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :board_id)
  end
end
