class CardActivity < ApplicationRecord
  enum activity_type: {is_card_comment:0, is_card_activity_item:1}
  belongs_to :card
  has_one :card_comment
  has_one :card_activity_item
end
