class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => :show


  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all.paginate(:page => params[:page], :per_page => 25)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource_attachments = @resource.resource_attachments.all
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @resource_attachment = @resource.resource_attachments.build
  end

  # GET /resources/1/edit
  def edit
    @resource_attachment = @resource.resource_attachments.build
    @resource_attachments = @resource.resource_attachments.all
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        unless params[:resource_attachments] == nil
          params[:resource_attachments]['picture'].each do |a|
            @resource_attachment = @resource.resource_attachments.create!(:picture => a)
          end
        end
        format.html { redirect_to @resource, notice: "#{@resource.common} was successfully created!" }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update

    respond_to do |format|
      if @resource.update(resource_params)
        unless params[:resource_attachments] == nil
          params[:resource_attachments]['picture'].each do |a|
            @resource_attachment = @resource.resource_attachments.create!(:picture => a)
          end
          format.html { redirect_to edit_resource_path(@resource.id), notice: 'Picture added!'}
        end

        format.html { redirect_to @resource, notice: "#{@resource.common} was successfully updated!" }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy

    @resource.resource_attachments.each do |kill|
      kill.destroy
      Dir.delete("public/uploads/resource_attachment/picture/#{kill.id}")
    end
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to plantdb_path, notice: "#{@resource.common} was removed from the PlantDB" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:binomial, :common, :description, resource_attachments_attributes: [:id, :resource_id, :picture, :caption])
    end
end
