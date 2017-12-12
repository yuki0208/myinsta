class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :confirm
    else
      render :new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    ContactMailer.received_email(@contact).deliver
    render :thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
