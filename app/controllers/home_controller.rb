class HomeController < ApplicationController
  def index
    @intros = Intro.first
    @about = About.last
    @stories = Story.last
  end
end
