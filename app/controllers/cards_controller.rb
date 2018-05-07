# Cards Controller
class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[show update_list update]

  def show
    render :modal, layout: false
  end

  def create
    @card = Card.new(card_params)
    redirect_to board_path(@card.list.board) if @card.save
  end

  def update
    return unless @card.update(params.permit(:name))
    render js: { sucess: '1', message: 'Card updated', card: @card }
  end

  def update_list
    return unless @card.new_list?(params[:list_id])
    old_list_name = @card.list.name
    return unless @card.update(card_list_params)
    @card.add_card_activity(
      "moved this card from #{old_list_name} to #{@card.list.name}",
      current_user
    )
    render json: {
      sucess: '1',
      message: 'Card List updated',
      card: @card
    }
  end

  private

  def set_card
    @card = Card.includes(:card_activities, :checklists).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def card_list_params
    params.permit(:list_id)
  end

  def card_params
    params.require(:card).permit(:name, :list_id)
  end
end
