class PhotosController < ApplicationController
  def index
    @photos = Photo.order(created_at: :desc)
  end

  def create
    Photo.create(photo_params)
    redirect_to root_path
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to root_path
  end   

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
