class ApplicationController < ActionController::Base
  before_action :set_nav

  private
  def set_nav
    @menu_sections = Section.all.order(:position)
  end
end
