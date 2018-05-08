# ChecklistItem Model
class ChecklistItem < ApplicationRecord
  include ChecklistItemsHelper
  enum status: { complete: 1, incomplete: 0 }
  validates_presence_of :status, :name
  belongs_to :checklist
end
