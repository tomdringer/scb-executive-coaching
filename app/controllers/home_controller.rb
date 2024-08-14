class HomeController < ApplicationController
  def index
    @reviews = Review.all
    @sections = Section.order(:order)
  end
end
