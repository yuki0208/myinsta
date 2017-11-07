class PhotopostsController < ApplicationController

  def index
    @photoposts = Photopost.order(created_at: :desc)
    @photopost = current_user.photoposts.build
  end

  def create
    @photopost = current_user.photoposts.new(photopost_params)
    if @photopost.save
      redirect_to photoposts_path
    else
      flash[:alert] = @photopost.errors.full_messages
      @photoposts = Photopost.order(created_at: :desc)
      render :index
    end
  end

  def destroy
    Photopost.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    @photopost = Photopost.find(params[:id])
  end

  def edit
    @photopost = Photopost.find(params[:id])
  end

  def update
    @photopost = Photopost.find(params[:id])
    if @photopost.update(photopost_params)
      flash[:success] = ["「#{@photopost.comment}」にしました"]
      redirect_to @photopost
    else
      flash[:alert] = @photopost.errors.full_messages
      render 'edit'
    end
  end

  private

   def photopost_params
     params.fetch(:photopost, {}).permit(:picture, :comment)
   end
end

