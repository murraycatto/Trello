class CardComment < ApplicationRecord
  belongs_to :user
  validates_presence_of :comment, :card_activity, :user
  belongs_to :card_activity
  after_initialize :set_activity_type

  def set_activity_type
    self.card_activity.activity_type = 0
  end
end
