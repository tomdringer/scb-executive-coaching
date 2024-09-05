class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]

  def index
    @sections = Section.order(:order)
  end
  # GET /sections or /sections.json
  def new
    @sections = Section.new
  end

  def edit
    render turbo_stream: turbo_stream.replace(
      "section_#{@section.id}",
      partial: "sections/form",
      locals: { section: @section }
    )
  end

  def show
    respond_to do |format|
      format.html {}
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "section_#{@section.id}",
          partial: "sections/section",
          locals: { section: @section }
        )
      end
    end
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to @section, notice: "Section was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      render turbo_stream: [
        turbo_stream.replace(
          "section_#{@section.id}",
          partial: "sections/section",
          locals: { section: @section }
        ),
        turbo_stream.replace(
          "sections_list",
          partial: "home/sections",
          locals: { sections: Section.order(:order) }
        )
      ]
    else
      render turbo_stream: turbo_stream.replace(
        "section_#{@section.id}",
        partial: "sections/form",
        locals: { section: @section }
      )
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy
    redirect_to section_url, notice: "Section was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:order, :name, :title, :hide_title, :title_colour, :title_size, :body, :background_colour, :hide_menu)
    end
end
