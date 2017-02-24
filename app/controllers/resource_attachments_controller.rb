class ResourceAttachmentsController < ApplicationController
  before_action :set_resource_attachment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => :show

  # GET /resource_attachments
  # GET /resource_attachments.json
  def index
    @resource_attachments = ResourceAttachment.all
  end

  # GET /resource_attachments/1
  # GET /resource_attachments/1.json
  def show
  end

  # GET /resource_attachments/new
  def new
    @resource_attachment = ResourceAttachment.new
  end

  # GET /resource_attachments/1/edit
  def edit
  end

  # POST /resource_attachments
  # POST /resource_attachments.json
  def create
    @resource_attachment = ResourceAttachment.new(resource_attachment_params)

    respond_to do |format|
      if @resource_attachment.save
        format.html { redirect_to @resource_attachment, notice: 'Resource attachment was successfully created.' }
        format.json { render :show, status: :created, location: @resource_attachment }
      else
        format.html { render :new }
        format.json { render json: @resource_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_attachments/1
  # PATCH/PUT /resource_attachments/1.json
  def update
    respond_to do |format|
    if @resource_attachment.update(resource_attachment_params)
      format.html { redirect_to edit_resource_path(@resource_attachment.resource_id), notice: 'Post attachment was successfully updated.' }
    end
  end
  end

  # DELETE /resource_attachments/1
  # DELETE /resource_attachments/1.json
  def destroy
    @resource_attachment.destroy
    Dir.delete("public/uploads/resource_attachment/picture/#{@resource_attachment.id}")
    respond_to do |format|
      # IDEALredirect => edit_resource_path(@resource_attachment.resource_id)
      format.html { redirect_to edit_resource_path(@resource_attachment.resource_id), notice: 'Resource attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_attachment
      @resource_attachment = ResourceAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_attachment_params
      params.require(:resource_attachment).permit(:resource_id, :picture, :caption)
    end
end
