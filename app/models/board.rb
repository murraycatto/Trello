class Board < ApplicationRecord
  validates_presence_of :name,:user,:color,:team
  belongs_to :user
  belongs_to :team
  belongs_to :color
  has_many :lists
  has_many :cards, through: :lists
end
