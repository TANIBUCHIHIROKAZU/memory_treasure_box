class Public::ContactsController < ApplicationController

 def new
  @contact = Contact.new
 end

 def confirm
  @contact = Contact.new(contact_params)
  if @contact.invalid?
   render :new
  end
 end

 def finish
  @contact = Contact.find(params[:id])
 end

 def create
  @contact = Contact.new(contact_params)
  if @contact.save
    ContactMailer.send_mail(@contact).deliver
    redirect_to finish_contact_path(@contact)
  else
    render :new
  end
 end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

end
