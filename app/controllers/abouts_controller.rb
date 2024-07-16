class AboutsController < ApplicationController
  before_action :set_about, only: [:edit, :update]

  def index
    @about = About.first_or_create
  end

  def new
    @about = About.new
    respond_to do |format|
      format.html { render :new, layout: false }
      format.turbo_stream
    end
  end

  def create
    @about = About.new(about_params)
    respond_to do |format|
      if @about.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('abouts', partial: 'home/about', locals: { about: @about }) }
        format.html { redirect_to root_path, notice: 'About was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('abouts', partial: 'abouts/form', locals: { about: @about }) }
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
    if @about.update(about_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('abouts', partial: 'home/about', locals: { about: @about }) }
        format.html { redirect_to root_path, notice: 'About was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('abouts', partial: 'abouts/form', locals: { about: @about }) }
        format.html { render :edit }
      end
    end
  end

  def show
    @about = About.find(params[:id])
  end

  private

  def set_about
    @about = About.find(params[:id])
  end

  def about_params
    params.require(:about).permit(:title, :hide_title, :title_colour, :title_size, :body, :body_text_colour, :body_text_size, :link_colour, :background_colour, :photo_one, :photo_two)
  end
end