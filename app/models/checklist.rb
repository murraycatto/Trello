class Checklist < ApplicationRecord
  belongs_to :card
  has_many :checklist_items
end
