class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @menu_sections = Section.uncached do
      Section.where(hide_menu: false).order(Arel.sql('COALESCE(position, 999999), id'))
    end
    Rails.logger.debug "Menu Sections: #{@menu_sections.map { |s| { id: s.id, position: s.position } }}"
    @blogs = Blog.all
    @resources = Resource.all
    @sections = Section.all
    @users = User.all
    @reviews = Review.all
    @categories = Category.all
    @policies = Policy.all
    @coaching = Coaching.all
  end
end
