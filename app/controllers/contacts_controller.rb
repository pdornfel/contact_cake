class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    redirect_to :contacts, notice: "Contact \"#{@contact.name}\" was successfully created."
  end

  def update
    @contact.update(contact_params)
    redirect_to :contacts, notice: "Contact \"#{@contact.name}\" was updated successfully"
  end

  def show
  end

  def edit
  end

  def destroy
    @contact.destroy
    redirect_to :contacts, notice: "You contact \"#{@contact.name}\" was deleted"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :user_id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end