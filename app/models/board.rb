class Board < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :color
  has_many :lists
end
