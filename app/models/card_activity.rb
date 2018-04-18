# Card Activity
class CardActivity < ApplicationRecord
  enum activity_type: { is_card_comment: 0, is_card_activity_item: 1 }
  validates :card_comment,
            presence: true,
            unless: -> { card_activity_item.present? }
  validates :card_activity_item,
            presence: true,
            unless: -> { card_comment.present? }
  belongs_to :card
  has_one :card_comment
  has_one :card_activity_item
end
