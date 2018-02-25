class CardActivityItem < ApplicationRecord
  belongs_to :card_activity
  belongs_to :user
  validates_presence_of :card_activity,:user,:content
  after_initialize :set_activity_type

  def set_activity_type
    self.card_activity.activity_type = 1
  end
end
