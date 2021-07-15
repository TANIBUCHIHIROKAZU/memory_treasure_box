class Public::ContactsController < ApplicationController

 def new
  @contact = Contact.new
 end

 def confirm
  if params[:contact].blank?
   redirect_to new_contact_path
   return
  end
  
  @contact = Contact.new(contact_params)
  
  if @contact.invalid?
   redirect_to new_contact_path
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
