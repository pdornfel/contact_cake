class FactsController < ApplicationController


  def new
    @fact = Fact.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @fact = Fact.new(fact_params)
    @fact.contact = @contact
    if @fact.save
      flash["alert-box success"] = "'#{@fact.fact}' added successfully"
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :contact_id)
  end

end