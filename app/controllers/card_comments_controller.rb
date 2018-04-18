class CardCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :build_card_comment, only: [:create]

  def create
    if @card_comment.save
      render :create, layout: false
    else
      render json: {
        sucess: '0',
        message: 'Card Comment failed to create',
        errors: @card_comment.errors
      }
    end
  end

  private

  def build_card_comment
    card = Card.find(params[:card_id])
    card_activity = card.card_activities.new
    @card_comment = card_activity.build_card_comment(card_comment_params)
    @card_comment.user = current_user
  end

  def card_comment_params
    params.require(:card_comment).permit(:comment)
  end
end
