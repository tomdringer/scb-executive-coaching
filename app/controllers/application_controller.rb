class ApplicationController < ActionController::Base
  before_action :set_nav

  private
  def set_nav
    @sections = Section.order(:order)
  end
end
