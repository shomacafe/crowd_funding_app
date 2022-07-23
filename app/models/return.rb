class Return < ApplicationRecord
  belongs_to :project
  mount_uploader :return_image, ImageUploader

  validates :return_image, presence: true
  validates :return_price, numericality: true, presence: true
  validates :return_name, presence: true
  validates :return_introduction, presence: true
end
