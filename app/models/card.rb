class Card < ApplicationRecord
  validates_presence_of :name
  belongs_to :list
  has_many :card_activities
  has_many :card_comments, through: :card_activities
  has_many :card_activity_items, through: :card_activities
end
