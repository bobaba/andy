class FarmsMapsController < ApplicationController
  before_action :set_farms_map, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /farms_maps
  # GET /farms_maps.json
  def index
    @farms_maps = FarmsMap.all.paginate(:page => params[:page], :per_page => 25)
  end

  # GET /farms_maps/1
  # GET /farms_maps/1.json
  def show
  end

  # GET /farms_maps/new
  def new
    @farms_map = FarmsMap.new
  end

  # GET /farms_maps/1/edit
  def edit
  end

  # POST /farms_maps
  # POST /farms_maps.json
  def create
    @farms_map = FarmsMap.new(farms_map_params)

    respond_to do |format|
      if @farms_map.save
        format.html { redirect_to farms_maps_path, notice: '#{@farms_map.name} was successfully added to the map!' }
        format.json { render :show, status: :created, location: @farms_map }
      else
        format.html { render :new }
        format.json { render json: @farms_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farms_maps/1
  # PATCH/PUT /farms_maps/1.json
  def update
    respond_to do |format|
      if @farms_map.update(farms_map_params)
        format.html { redirect_to farms_maps_path, notice: "#{@farms_map.name} was successfully updated!" }
        format.json { render :show, status: :ok, location: @farms_map }
      else
        format.html { render :edit }
        format.json { render json: @farms_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms_maps/1
  # DELETE /farms_maps/1.json
  def destroy
    @farms_map.destroy
    respond_to do |format|
      format.html { redirect_to farms_maps_url, notice: 'Farms map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farms_map
      @farms_map = FarmsMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farms_map_params
      params.require(:farms_map).permit(:name, :address, :latitude, :longitude, :description)
    end
end
