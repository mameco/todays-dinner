class CookingTime < ApplicationRecord
  validates :time, presence: true
  has_many :menus
end
