class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.uploads
  end

  def new
    @upload = current_user.uploads.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)
    @upload.file.attach(upload_params[:file])
    if @upload.save
      TinyLink.create(upload: @upload, short_url: generate_unique_short_url)
      redirect_to root_path, notice: "File Upload Created successfully"
    else
      redirect_back(fallback_location: root_path, alert: "File could not be uploaded. #{@upload.errors.map{|a| (a.options[:message])}.join(". ") }")
    end
  end

  def destroy
    @upload = current_user.uploads.find(params[:id])
    @upload.destroy
    redirect_to root_path
  end

  private

  def generate_unique_short_url
    existing_urls = TinyLink.all.pluck(:short_url)
    loop do
      url = SecureRandom.urlsafe_base64(7)
      if existing_urls.include?(url)
        next
      else
        return url
      end
    end
  end

  def upload_params
    params.require(:upload).permit(:title, :description, :file)
  end
end
