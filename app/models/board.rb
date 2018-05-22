# Board Model
class Board < ApplicationRecord
  include BoardsHelper
  after_create :add_labels
  validates_presence_of :name, :user, :color, :team
  belongs_to :user
  belongs_to :team
  belongs_to :color
  has_many :lists
  has_many :labels
  has_many :cards, through: :lists
end
