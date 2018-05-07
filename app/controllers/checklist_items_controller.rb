class ChecklistItemsController < ApplicationController
  def create
    @checklist = Checklist.find(params[:checklist_id])
    @checklist_item = @checklist.checklist_items.new(checklist_item_params)
    render :create, layout: false if @checklist_item.save!
  end

  def update_status
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist = @checklist_item.checklist
    card = @checklist.card
    if @checklist_item.complete?
      @checklist_item.incomplete!
    else
      @checklist_item.complete!
    end

    card_activity = card.card_activities.new
    card_activity.build_card_activity_item(
      content: "marked #{@checklist_item.name} #{@checklist_item.status} on this card",
      user: current_user
    )
    card_activity.save!

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

  def checklist_item_params
    params.require(:checklist_item).permit(:name)
  end
end
