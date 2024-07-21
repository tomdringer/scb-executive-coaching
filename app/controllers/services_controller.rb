class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update]

  def new
    @service = Service.new
    respond_to do |format|
      format.html { render :new, layout: false }
      format.turbo_stream
    end
  end

  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('services', partial: 'home/services', locals: { service: @service }) }
        format.html { redirect_to root_path, notice: 'Services was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('services', partial: 'services/form', locals: { service: @service }) }
        format.html { render :new }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render :edit, layout: false }
      format.turbo_stream
    end
  end

  def update
    if @service.update(service_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('services', partial: 'home/services', locals: { services: @services }) }
        format.html { redirect_to root_path, notice: 'Services was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('services', partial: 'services/form', locals: { service: @service }) }
        format.html { render :edit }
      end
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :hide_title, :title_colour, :title_size, :body, :body_text_colour, :body_text_size, :link_colour, :background_colour, :photo_one, :photo_two)
  end
end