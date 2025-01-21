module Admin
  class ManageableController < BaseController
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :load_menu_sections

    def index
      @resources = resource_class.all
    end

    def show
    end

    def new
      @resource = resource_class.new
    end

    def edit
    end

    def create
      @resource = resource_class.new(resource_params)

      if @resource.save
        redirect_to [:admin, @resource], notice: "#{resource_name} was successfully created."
      else
        render :new
      end
    end

    def update
      if @resource.update(resource_params)
        redirect_to [:admin, @resource], notice: "#{resource_name} was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @resource.destroy
      redirect_to [:admin, resource_class], notice: "#{resource_name} was successfully deleted."
    end

    private

    def set_resource
      @resource = resource_class.find(params[:id])
    end

    def resource_class
      raise NotImplementedError, "#{self.class} must implement #resource_class"
    end

    def resource_name
      resource_class.name.humanize
    end

    def resource_params
      raise NotImplementedError, "#{self.class} must implement #resource_params"
    end
  end
end
