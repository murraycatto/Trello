class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: [:show,:update_list,:update]

  def show
    render layout: false
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to board_path(@card.list.board)
    else
      redirect_to boards_path
    end
  end


  def update
    #//TODO Add validations
    if @card.update(params.permit(:name))
      render :json =>{sucess:"1",message:"Card updated"}
    else
      render :json =>{sucess:"1",message:"Card failed to update"}
    end
  end

  def update_list
    #//TODO Add validations
    if @card.update(card_list_params)
      render :json =>{sucess:"1",message:"Card List updated"}
    else
      render :json =>{sucess:"1",message:"Card List failed to update"}
    end
  end


  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_list_params
      params.permit(:list_id)
    end

    def card_params
      params.require(:card).permit(:name,:list_id)
    end
end
