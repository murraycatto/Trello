class ChecklistItemsController < ApplicationController
  def create
    checklist = Checklist.find(params[:checklist_id])
    @checklist_item = checklist.checklist_items.new(checklist_item_params)
    render :create, layout: false if @checklist_item.save!
  end

  private

  def checklist_item_params
    params.require(:checklist_item).permit(:name)
  end
end
