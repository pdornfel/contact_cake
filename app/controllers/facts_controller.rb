class FactsController < ApplicationController


  def new
    @fact = Fact.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @fact = Fact.new(fact_params)
    @fact.contact = @contact
    #@fact.contact = current_user
    if @fact.save
      redirect_to contact_path(@contact), notice: "Fact added successfully"
    else
      render 'new'
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :contact_id)
  end

end