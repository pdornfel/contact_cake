class FactsController < ApplicationController


  def new
    @fact = Fact.new
    @contact = Contact.find(params[:contact_id])
  end



end