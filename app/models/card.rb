# Card Model
class Card < ApplicationRecord
  include CardsHelper
  validates_presence_of :name, :list
  belongs_to :list
  has_many :card_activities
  has_many :checklists
  has_many :card_comments, through: :card_activities
  has_many :card_activity_items, through: :card_activities
  has_many :card_labels
end
