# Checklist Model
class Checklist < ApplicationRecord
  include ChecklistsHelper
  validates_presence_of :title
  belongs_to :card
  has_many :checklist_items
end
