class Upload < ApplicationRecord
  belongs_to :user

  has_one_attached :file
  validates :file, size: { less_than: 1.gigabytes, message: 'File is too large' }
end
