class HomeController < ApplicationController
  def index
    @reviews = Review.all
    @home_sections = Section.order(:order).where(show_on_home: true)
    @menu_sections = Section.order(:order)
  end
end
