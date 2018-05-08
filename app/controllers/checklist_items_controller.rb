# Checklist Items Controller
class ChecklistItemsController < ApplicationController
  before_action :set_checklist, :set_js_format, only: [:create]
  before_action :set_checklist_item, only: [:toggel_status]
  def create
    @checklist_item = @checklist.checklist_items.new(checklist_item_params)
    return unless @checklist_item.save
    render :create, layout: false
  end

  def toggel_status
    @checklist = @checklist_item.checklist
    @checklist_item.toggel_status
    @checklist.card.add_card_activity(
      "marked #{@checklist_item.name} #{@checklist_item.status} on this card",
      current_user
    )
    render json: {
      sucess: '1',
      message: 'Sucess',
      checklist_item_status: @checklist_item.status,
      checklist_id: @checklist.id,
      complete_percentage: @checklist.complete_percentage,
      checklist_complete: @checklist.complete?
    }
  end

  private

  def set_js_format
    request.format = 'js'
  end

  def set_checklist
    @checklist = Checklist.find(params[:checklist_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def set_checklist_item
    @checklist_item = ChecklistItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  def checklist_item_params
    params.require(:checklist_item).permit(:name)
  end
end
