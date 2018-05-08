# Checklists Controller
class ChecklistsController < ApplicationController
  before_action :set_card, :set_format
  def create
    @checklist = @card.checklists.new(checklist_params)
    return unless @checklist.save
    render :create, layout: false
  end

  private

  def set_format
    request.format = 'js'
  end

  def set_card
    @card = Card.find(params[:card_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
