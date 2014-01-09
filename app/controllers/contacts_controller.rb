class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      flash["success"] = "'#{@contact.name}' created successfully."
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def update
    @contact.update(contact_params)
    flash[:warning] = "'#{@contact.name}' updated successfully."
    redirect_to :contacts
  end

  def show
  end

  def edit
  end

  def destroy
    @contact.destroy
    flash["alert-box warning"] = "'#{@contact.name}\'' deleted"
    redirect_to :contacts
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :contact_photo)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end