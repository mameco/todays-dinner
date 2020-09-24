class Menu < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  mount_uploader :image, ImageUploader
  validates :cookingTime_id, :image, :point, :content, presence: true
  belongs_to :user
  belongs_to :cookingTime
  has_many :menu_keywords
  has_many :keywords, through: :menu_keywords
  def self.search(search)
    if search
      Menu.joins(:keywords).where('point LIKE(?) OR content LIKE(?) OR keywords.word LIKE(?)', "%#{search}%","%#{search}%","%#{search}%")
    else
      Menu.all
    end
  end
end
