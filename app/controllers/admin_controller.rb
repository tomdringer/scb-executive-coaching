 class AdminController < ApplicationController
    before_action :authenticate_user!
    def index
      @menu_sections = Section.where(hide_menu: false)
      @blogs = Blog.all
      @resources = Resource.all
      @sections = Section.all
      @users = User.all
      @reviews = Review.all
    end
  end