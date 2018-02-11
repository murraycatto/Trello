class Team < ApplicationRecord
  validates_presence_of :user,:name
  
  has_many :boards
  belongs_to :user
end
