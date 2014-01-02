class FactsController < ApplicationController


  def new
    @fact = Fact.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.contact = params[:contact_id]
    #@fact.contact = current_user
    if @fact.save
      redirect_to :contact, notice: "Fact was successfully created"
    else
      render 'new'
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :contact_id)
  end

end