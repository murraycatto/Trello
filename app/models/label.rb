# Label Model
class Label < ApplicationRecord
  belongs_to :board
  belongs_to :color
end
