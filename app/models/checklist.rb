# Checklist Model
class Checklist < ApplicationRecord
  validates_presence_of :title
  belongs_to :card
  has_many :checklist_items
end
