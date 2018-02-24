class Card < ApplicationRecord
  validates_presence_of :name
  belongs_to :list
  has_many :card_comments
end
