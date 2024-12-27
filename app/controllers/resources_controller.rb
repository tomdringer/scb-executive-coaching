class ResourcesController < ApplicationController
  before_action :set_resource, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]

  # GET /blogs or /blogs.json
  def index
    @resources = Resource.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @resource = Resource.find(params[:id])
  end

  # GET /blogs/new
  def new
    @resource = Resource.new
    @resource_categories = Category.where(area: 'resource')
  end

  # GET /blogs/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @resource_categories = Category.where(area: 'resource')
  end

  # POST /blogs or /blogs.json
  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: 'Resource created successfully'
    else
      render :new
    end
  end


  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource updated successfully'
    else
      render :edit, alert: 'There was an error updating the resource'
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @resource.destroy!

    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resources was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def resource_params
    params.require(:resource).permit(:title, :author, :body, :file_upload, :link, :description, :preview,
resource_categories_attributes: [:id, :category_id, :_destroy])
  end
end
