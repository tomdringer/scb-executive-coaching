class IntrosController < ApplicationController
  before_action :set_intro, only: [:edit, :update]

  def new
    @intro = Intro.new
    respond_to do |format|
      format.html { render :new, layout: false }
      format.turbo_stream
    end
  end

  def create
    @intro = Intro.new(intro_params)
    respond_to do |format|
      if @intro.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('intros', partial: 'home/intros', locals: { intros: @intro }) }
        format.html { redirect_to root_path, notice: 'Intro was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('intros', partial: 'intros/form', locals: { intro: @intro }) }
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
    if @intro.update(intro_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('intros', partial: 'home/intros', locals: { intros: @intro }) }
        format.html { redirect_to root_path, notice: 'Intro was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('intros', partial: 'intros/form', locals: { intro: @intro }) }
        format.html { render :edit }
      end
    end
  end

  private

  def set_intro
    @intro = Intro.find(params[:id])
  end

  def intro_params
    params.require(:intro).permit(:title, :hide_title, :title_colour, :title_size, :body, :body_text_colour, :body_text_size, :link_colour, :background_colour, :photo_one, :photo_two)
  end
end