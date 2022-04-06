class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.uploads
  end

  def new
    @upload = Upload.new
  end
end
