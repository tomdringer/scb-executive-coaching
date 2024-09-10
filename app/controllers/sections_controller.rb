class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]

  def index
    @sections = Section.order(:order)
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def show
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
      redirect_to @section, notice: "Section was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    redirect_to sections_url, notice: "Section was successfully destroyed."
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:order, :name, :title, :hide_title, :reviews, :title_colour, :title_size, :body, :background_colour, :hide_menu)
  end
end