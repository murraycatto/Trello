# ChecklistItem Model
class ChecklistItem < ApplicationRecord
  enum status: { complete: 1, incomplete: 0 }
  validates_presence_of :status, :name
  belongs_to :checklist
end
