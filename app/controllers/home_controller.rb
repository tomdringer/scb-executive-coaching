class HomeController < ApplicationController
  def index
    @intros = Intro.first
  end
end
