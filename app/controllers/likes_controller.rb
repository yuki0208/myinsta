class LikesController < ApplicationController

  before_action :set_variables

  def like
    like = current_user.likes.new(photopost_id: @photopost.id)
    like.save!
  end

  def unlike
    like = current_user.likes.find_by(photopost_id: @photopost.id)
    like.destroy!
  end

  private

   def set_variables
     @photopost = Photopost.find(params[:photopost_id])
     @id_name = "#like-link-#{@photopost.id}"
     @id_heart = "#heart-#{@photopost.id}"
     Rails.logger.info @id_name
     Rails.logger.info @id_heart
   end
end
