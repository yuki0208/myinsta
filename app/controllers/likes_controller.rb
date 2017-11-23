class LikesController < ApplicationController

  def create
    @photopost = Photopost.find(params[:photopost_id])
    @like = current_user.likes.create(photopost_id: params[:photopost_id])
    render 'likes/create'
  end

  def destroy
    @photopost = Photopost.find(params[:photopost_id])
    like = current_user.likes.find_by(photopost_id: params[:photopost_id])
    like.destroy if like
    render 'likes/create'
  end
end
