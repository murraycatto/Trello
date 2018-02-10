class CardsController < ApplicationController
  before_action :set_card, only: [:show,:update_list,:update]

  def show
    render layout: false
  end

  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.html {
            redirect_to board_path(List.find(params.require(:card)[:list_id]).board)
        }
      else
        format.html { redirect_to boards_path}
      end
    end
  end


  def update
    #//TODO Add validations
    if @card.update(card_params)
      render :json => @card
    else
      render :json => {error:"Card failed to update"}
    end
  end

  def update_list
    #//TODO Add validations
    @card.update(card_list_params)
  end


  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_list_params
      params.require(:card).permit(:list_id)
    end

    def card_params
      params.permit(:name)
    end
end
