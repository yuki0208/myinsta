class PhotosController < ApplicationController
  
  def index
    @photos = Photo.order(created_at: :desc)
  end

  def create
    Photo.create(photo_params)
  end

  def destroy
    Photo.find(params[:id]).destroy
    redirect_to photo_path
  end   

  def photo_params
    params.require(:photo).permit(:picture, :comment)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:success] = ["「#{@photo.comment}」にしました"]
      redirect_to @photo
    else 
      flash[:alert] = @photo.errors.full_messages
      render 'edit'
    end
  end
end
