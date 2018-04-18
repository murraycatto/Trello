class CardActivityItem < ApplicationRecord
  belongs_to :user
  belongs_to :card_activity
  validates_presence_of :card_activity, :user, :content
  after_initialize :set_activity_type

  def set_activity_type
    card_activity.activity_type = 1
  end
end
