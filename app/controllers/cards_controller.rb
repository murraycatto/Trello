class CardsController < ApplicationController
  before_action :set_card, only: [:show]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :list_id)
    end
end
