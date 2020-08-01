class Menu < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON
  mount_uploader :image, ImageUploader
  validates :image, :point, :content, :time, presence: true
  belongs_to :user

  def self.search(search)
    if search
      Menu.where('point LIKE(?) OR content LIKE(?)', "%#{search}%","%#{search}%")
    else
      Menu.all
    end
  end
end
