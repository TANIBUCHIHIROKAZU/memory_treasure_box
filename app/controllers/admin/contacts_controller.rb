class Admin::ContactsController < ApplicationController
  def index
    @contact = Contact.page(params[:page]).per(10)
  end
  
  def show
    begin
      @contact = Contact.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to admin_contacts_path
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path
  end
end
