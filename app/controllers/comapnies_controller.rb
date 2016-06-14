class ComapniesController < ApplicationController
  before_action :set_comapny, only: [:show, :edit, :update, :destroy]

  # GET /comapnies
  # GET /comapnies.json
  def index
    @comapnies = Comapny.all
  end

  # GET /comapnies/1
  # GET /comapnies/1.json
  def show
  end

  # GET /comapnies/new
  def new
    @comapny = Comapny.new
  end

  # GET /comapnies/1/edit
  def edit
  end

  # POST /comapnies
  # POST /comapnies.json
  def create
    @comapny = Comapny.new(comapny_params)

    respond_to do |format|
      if @comapny.save
        format.html { redirect_to @comapny, notice: 'Comapny was successfully created.' }
        format.json { render :show, status: :created, location: @comapny }
      else
        format.html { render :new }
        format.json { render json: @comapny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comapnies/1
  # PATCH/PUT /comapnies/1.json
  def update
    respond_to do |format|
      if @comapny.update(comapny_params)
        format.html { redirect_to @comapny, notice: 'Comapny was successfully updated.' }
        format.json { render :show, status: :ok, location: @comapny }
      else
        format.html { render :edit }
        format.json { render json: @comapny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comapnies/1
  # DELETE /comapnies/1.json
  def destroy
    @comapny.destroy
    respond_to do |format|
      format.html { redirect_to comapnies_url, notice: 'Comapny was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comapny
      @comapny = Comapny.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comapny_params
      params.require(:comapny).permit(:name, :location, :industry)
    end
end
