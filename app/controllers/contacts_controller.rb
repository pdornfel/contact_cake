class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to :contacts, notice: "Contact \'#{@contact.name}\' successfully created."
    else
      render 'new'
    end
  end

  def update
    @contact.update(contact_params)
    redirect_to :contacts, notice: "Contact \'#{@contact.name}\'' updated successfully"
  end

  def show
  end

  def edit
  end

  def destroy
    @contact.destroy
    redirect_to :contacts, notice: "You contact \'#{@contact.name}\'' deleted"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :user_id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end