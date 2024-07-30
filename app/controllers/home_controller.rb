class HomeController < ApplicationController
  def index
    @intros = Intro.first
    @about = About.last
    @stories = Story.last
    @reviews = Review.all
    @service = Service.last
  end
end
