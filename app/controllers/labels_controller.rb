# Labels Controller
class LabelsController < ApplicationController
  before_action :set_label
  def edit
    render :edit, layout: false
  end

  def update
    render :update, layout: false if @label.update(label_params)
  end

  private

  def label_params
    params.require(:label).permit(:name, :color_id)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
