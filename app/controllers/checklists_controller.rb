class ChecklistsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    @checklist = @card.checklists.new(checklist_params)
    if @checklist.save
      render :create, layout: false
    else
      render json: {
        sucess: '0',
        message: 'Checklist failed to create',
        errors: @checklist.errors
      }
    end
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
