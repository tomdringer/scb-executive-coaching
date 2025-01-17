class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy move]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Get reorders sorted by position
    reordered_ids = Reorder.order(:position).pluck(:item_id)

    # Use the ordering to sort @sections
    @sections = Section.all.sort_by { |section| reordered_ids.index(section.id) || Float::INFINITY }
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
      redirect_to root_path, notice: 'Section was successfully created.'
    else
      Rails.logger.debug(@section.errors.full_messages)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @section = Section.find(params[:id])
    @section = GlobalID::Locator.locate_signed(params[:sgid])
    @item.insert_at(params[:position])

    if @section.update(section_params)
      redirect_to root_path, notice: 'Section was successfully updated.'

      Rails.logger.debug(@section.errors.full_messages)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    Rails.logger.debug(@section.errors.full_messages)
    redirect_to root_url, notice: 'Section was successfully destroyed.'
  end

  def move
    @section.insert_at(params[:position].to_i)
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:order, :name, :title, :hide_title, :reviews, :title_colour, :title_size, :body, :custom_link, :background_colour, :hide_menu, :show_on_home, :position)
  end
end
