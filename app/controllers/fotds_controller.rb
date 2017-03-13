class FotdsController < ApplicationController
  before_action :set_fotd, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  impressionist :actions=>[:show,:index]
  respond_to :html

  # GET /fotds
  # GET /fotds.json
  def index
    @fotds = Fotd.all
  end

  # GET /fotds/1
  # GET /fotds/1.json
  def show
  end

  # GET /fotds/new
  def new
    @fotd = Fotd.new
  end

  # GET /fotds/1/edit
  def edit
  end

  # POST /fotds
  # POST /fotds.json
  def create
    @fotd = Fotd.new(fotd_params)

    respond_to do |format|
      if @fotd.save
        format.html { redirect_to @fotd, notice: 'Fotd was successfully created.' }
        format.json { render :show, status: :created, location: @fotd }
      else
        format.html { render :new }
        format.json { render json: @fotd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fotds/1
  # PATCH/PUT /fotds/1.json
  def update
    respond_to do |format|
      if @fotd.update(fotd_params)
        format.html { redirect_to @fotd, notice: 'Fotd was successfully updated.' }
        format.json { render :show, status: :ok, location: @fotd }
      else
        format.html { render :edit }
        format.json { render json: @fotd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotds/1
  # DELETE /fotds/1.json
  def destroy
    @fotd.destroy
    respond_to do |format|
      format.html { redirect_to fotds_url, notice: 'Fotd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fotd
      @fotd = Fotd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fotd_params
      params.require(:fotd).permit(:fact_id)
    end
end
