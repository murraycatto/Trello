class ListsController < ApplicationController
  before_action :set_list, only: [:update, :destroy]

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      redirect_to root_path
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      redirect_to root_path
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :board_id)
    end
end
