class User < ApplicationRecord
  has_many :boards
  has_many :teams
  has_many :card_comments
  has_many :card_activity_items
  has_many :card_activities, through: :card_comments
  has_many :card_activities, through: :card_activity_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_personal_team

  def create_personal_team
    Team.create!(user:self, name:"Personal Boards", personal:true, private:true)
    return true
  end
end
