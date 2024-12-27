class Resource < ApplicationRecord
  has_many :resource_categories, dependent: :destroy
  has_many :categories, through: :resource_categories
  has_one_attached :preview
  has_one_attached :file_upload
  before_save :purge_old_file, if: :file_upload_changed?

  accepts_nested_attributes_for :resource_categories, allow_destroy: true

  private

  def purge_old_file
    file_upload.purge_later if file_upload.attached?
  end
end