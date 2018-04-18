class CardComment < ApplicationRecord
  belongs_to :user
  belongs_to :card_activity
  validates_presence_of :comment, :card_activity, :user
  after_initialize :set_activity_type

  def set_activity_type
    card_activity.activity_type = 0
  end
end
