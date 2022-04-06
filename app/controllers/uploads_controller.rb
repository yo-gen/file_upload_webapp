class UploadsController < ApplicationController
  def index
    @uploads = @current_user.uploads
  end
end
