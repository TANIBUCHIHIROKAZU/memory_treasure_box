class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contact = Contact.page(params[:page]).per(10).reverse_order
  end

  def show
    @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to admin_contacts_path
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path
  end
end
