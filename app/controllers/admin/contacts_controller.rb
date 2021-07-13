class Admin::ContactsController < ApplicationController
  def index
    @contact = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path
  end
end
