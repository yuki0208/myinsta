class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, photopost_id: params[:photopost_id])
    @likes = Like.where(photopost_id: params[:photopost_id])
  end

  def destroy
    like = Likes.find_by(user_id: current_user.id, photopost_id: params[:photopost_id])
    like.destroy
    @likes = Like.where(photopost_id: params[:photopost_id])
  end
end
