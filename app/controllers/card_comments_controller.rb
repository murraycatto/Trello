# Card Comments Controller
class CardCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :build_card_comment, only: [:create]
  before_action :set_format

  def create
    return unless @card_comment.save
    render :create, layout: false
  end

  private

  def set_format
    request.format = 'js'
  end

  def build_card_comment
    card = Card.find(params[:card_id])
    card_activity = card.card_activities.new
    @card_comment = card_activity.build_card_comment(card_comment_params)
    @card_comment.user = current_user
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def card_comment_params
    params.require(:card_comment).permit(:comment)
  end
end
