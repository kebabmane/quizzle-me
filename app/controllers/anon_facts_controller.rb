class AnonFactsController < ApplicationController


  def new
    @fact = Fact.new
    respond_with(@fact)
  end


  def create
    @fact = Fact.new(fact_params)
    @fact.displayed = false
    respond_to do |format|
      if @fact.save
        format.js
      else
        format.js   { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:fact_string)
    end
end
