class CardComment < ApplicationRecord
  belongs_to :card
  belongs_to :user
  validates_presence_of :comment, :card, :user
end
