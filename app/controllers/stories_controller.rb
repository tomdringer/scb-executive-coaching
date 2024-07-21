class StoriesController < ApplicationController
  before_action :set_story, only: [:edit, :update]

  def new
    @stories = Story.new
    respond_to do |format|
      format.html { render :new, layout: false }
      format.turbo_stream
    end
  end

  def create
    @stories = Story.new(story_params)
    respond_to do |format|
      if @stories.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('stories', partial: 'home/story', locals: { Story: @stories }) }
        format.html { redirect_to root_path, notice: 'Story was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('stories', partial: 'stories/form', locals: { Story: @stories }) }
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
    if @stories.update(story_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('stories', partial: 'home/story', locals: { stories: @stories }) }
        format.html { redirect_to root_path, notice: 'Story was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('stories', partial: 'stories/form', locals: { stories: @stories }) }
        format.html { render :edit }
      end
    end
  end

  private

  def set_story
    @stories = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :hide_title, :title_colour, :title_size, :body, :body_text_colour, :body_text_size, :link_colour, :background_colour, :photo_one, :photo_two)
  end
end