class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]

  def index
    @sections = Section.order(:order)
  end
  # GET /sections or /sections.json
  def new
    @section = Section.new
    respond_to do |format|
      format.html { render :new, layout: false }
      format.turbo_stream
    end
  end

  # GET /sections/1 or /sections/1.json
  def show
  end

  # GET /sections/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit, layout: false }
      format.turbo_stream
    end
  end

  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params)
    respond_to do |format|
      if @section.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', partial: 'home/sections', locals: { sections: Section.order(:order) }) }
        format.html { redirect_to root_path, notice: 'Section was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', partial: 'sections/form', locals: { section: @section }) }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    if @section.update(section_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', partial: 'home/sections', locals: { sections: Section.order(:order) }) }
        format.html { redirect_to root_path, notice: 'Section was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', partial: 'sections/form', locals: { section: @section }) }
        format.html { render :edit }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_path, notice: 'Section was successfully deleted.' }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:order, :name, :title, :hide_title, :title_colour, :title_size, :body, :body_text_colour, :body_text_size, :link_colour, :background_colour)
    end
end
