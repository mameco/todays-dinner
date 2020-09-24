class Keyword < ApplicationRecord
  has_many :menu_keywords
  has_many :menus, through: :menu_keywords
end
