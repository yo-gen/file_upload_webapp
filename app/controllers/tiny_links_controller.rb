class TinyLinksController < ApplicationController
  def show
    @tiny_link = TinyLink.find_by(short_url: params[:short_url])
    if @tiny_link.nil?
      redirect_to root_path, notice: "No Such Link Found"
    end
  end
end