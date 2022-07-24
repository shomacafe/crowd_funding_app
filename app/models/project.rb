class Project < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_many :returns, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :returns, allow_destroy: true
  has_rich_text :content
  
  mount_uploader :image, ImageUploader
  mount_uploader :return_image, ImageUploader

  validates :title, presence: true
  validates :target_amount, numericality: true, presence: true
  validates :catch_copy_1, presence: true
  validates :catch_copy_2, presence: true
  validates :catch_copy_3, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :image, presence: true
  validates :content, presence: true
  validates_associated :returns

  validate :start_end_check
  validate :date_before_start

  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
  end

  def start_end_check
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end
end
