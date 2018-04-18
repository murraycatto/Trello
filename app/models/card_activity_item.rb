# Card Activity Item Model
class CardActivityItem < ApplicationRecord
  validates_presence_of :card_activity, :user, :content

  belongs_to :user
  belongs_to :card_activity
  after_initialize :set_activity_type

  def set_activity_type
    card_activity.activity_type = 1
  end
end
