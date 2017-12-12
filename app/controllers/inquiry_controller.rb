class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      render 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry])
    InquiryMailer.received_email(@inquiry).deliver
    render 'thanks'
  end
end
