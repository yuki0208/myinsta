class PhotopostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]

  def index
    @photoposts = Photopost.order(created_at: :desc)
    @photopost = current_user.photoposts.build
  end

  def new
    @photopost = current_user.photoposts.build
  end

  def create
    @photopost = current_user.photoposts.new(photopost_params)
    if @photopost.save
    else
      flash[:alert] = @photopost.errors.full_messages
      @photoposts = Photopost.order(created_at: :desc)
    end
  end

  def destroy
    Photopost.find(params[:id]).destroy
    redirect_to photoposts_path
  end

  def show
    @photopost = Photopost.find(params[:id])
    @likes = Like.where(photopost_id: params[:photopost_id])
  end

  def edit
    @photopost = Photopost.find(params[:id])
  end

  def update
    @photopost = Photopost.find(params[:id])
    if @photopost.update(photopost_params)
       redirect_to @photopost
    else
      render 'edit'
    end
  end

  private

   def photopost_params
     params.fetch(:photopost, {}).permit(:picture, :comment, :id, :user_id)
   end

   def correct_user
      @photopost = current_user.photoposts.find_by(id:params[:id])
      redirect_to root_url if @photopost.nil?
    end
end
