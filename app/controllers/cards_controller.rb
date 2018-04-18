class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[show update_list update]

  def show
    render :modal, layout: false
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
    if @card.update(params.permit(:name))
      render js: { sucess: '1', message: 'Card updated', card: @card }
    else
      render json: {
        sucess: '0',
        message: 'Card failed to update',
        errors: @card.errors
      }
    end
  end

  def update_list
    if @card.new_list?(params[:list_id])
      if @card.update(card_list_params)
        card_activity = @card.card_activities.new
        card_activity.build_card_activity_item(content: "moved this card from #{old_list.name} to #{@card.list.name}", user: current_user)
        card_activity.save!
        render json: { sucess: '1', message: 'Card List updated', card: @card }
      else
        render json: { sucess: '1', message: 'Card List failed to update', errors: @card.errors }
      end
    end
  end

  private

  def set_card
    @card = Card.includes(:card_activities, :checklists).find(params[:id])
  end

  def card_list_params
    params.permit(:list_id)
  end

  def card_params
    params.require(:card).permit(:name, :list_id)
  end
end
