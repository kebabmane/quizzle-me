class FactsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_fact, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show,:index]
  respond_to :html
  layout "landing"

  def index
   	if params[:search].present?
  		@facts = Fact.search(params[:search], page: params[:page])
  		@fact = Fact.new
  	else
  		@facts = Fact.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
      @fact = Fact.new
    end

    respond_to do |format|
        format.html
        format.csv  { render csv: @facts }
    end
  end


  def show
    @facts = Fact.find(params[:id])
  end

  def new
    @fact = Fact.new
    respond_with(@fact)
  end

  def edit
  end

  def import
    Fact.import(params[:file])
    format.html { redirect_to facts_path, notice: 'new facts have been added to the database' }
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.user_id = current_user.id
    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fact }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
        format.js   { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fact.update(fact_params)
    respond_with(@fact)
  end

  def destroy
  	@fact.destroy
    respond_with(@fact)
  end

  private
    def set_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:fact_string,:user_id, :displayed, :tag_list)
    end
end
