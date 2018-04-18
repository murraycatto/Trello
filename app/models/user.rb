class User < ApplicationRecord
  validates_presence_of :email, :name
  has_many :boards
  has_many :teams
  has_many :card_comments
  has_many :card_activity_items
  has_many :card_comment_activities, through: :card_comments, class_name: 'CardActivity'
  has_many :card_activities, through: :card_activity_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_personal_team

  def create_personal_team
    Team.create!(user: self, name: 'Personal Boards', personal: true, private: true)
    true
  end
end
