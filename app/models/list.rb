class List < ApplicationRecord
  validates_presence_of :board,:name
  belongs_to :board
  has_many :cards, through: :boards
end
