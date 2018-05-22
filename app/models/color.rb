# Color Model
class Color < ApplicationRecord
  validates_presence_of :name
  has_many :boards
  has_many :card_labels
end
