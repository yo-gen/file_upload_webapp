class Upload < ApplicationRecord
  after_create_commit :compress_big_files

  belongs_to :user
  has_one :tiny_link, dependent: :destroy

  has_one_attached :file
  validates :file, size: { less_than: 1.gigabytes, message: 'File is too large' }

  def compress_big_files
    return if file.byte_size <= 50.megabytes # Compress only if file size greater than 50 MB
    zipped_filename = "#{file.filename.to_s}.gz"
    tempfile = Tempfile.new()
    begin
      Zlib::GzipWriter.open(tempfile.path) do |gz|
        gz.write(file.download)
      end
      file.attach(io: File.open(tempfile.path), filename: zipped_filename, content_type: 'application/zip')
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end
