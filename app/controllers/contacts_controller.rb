class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for the message. I will get back to you soon.'
      redirect_to profile_path
    else
      flash[:notice] = 'Something went wrong. Couldn\'t deliver message'
      render 'new'
    end
  end



end
