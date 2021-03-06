class FactsController < ApplicationController


  def new
    @fact = Fact.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @fact = Fact.new(fact_params)
    @fact.contact = @contact

    respond_to do |format|
    if @fact.save
      flash["alert-box success"] = "'#{@fact.fact}' added successfully"
      format.html { redirect_to contact_path(@contact)}
      format.json { render json: @fact }
    else
      format.html { render 'new' }
      format.json { render json: @fact.errors, status: :unprocessable_fact }
    end
  end
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @fact = Fact.find(params[:id])
  end

  def update
    @fact = Fact.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    @fact.update(fact_params)
    flash[:warning] = "'#{@fact.fact}' updated successfully."
    redirect_to edit_contact_path(@contact)
  end

  def destroy
    @fact = Fact.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    @fact.destroy
    flash["alert-box warning"] = "'#{@fact.fact}' deleted"
    redirect_to edit_contact_path(@contact)
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :contact_id)
  end

end