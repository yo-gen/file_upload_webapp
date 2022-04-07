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
    @upload.save!
    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:title, :description, :file)
  end
end
