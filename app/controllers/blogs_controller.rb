class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_blog_categories, only: %i[new edit]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @blogs = Blog.all
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def edit
    Rails.logger.debug "Blog found: #{@blog.inspect}"
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Post created successfully' }
        format.json { render :show, status: :created, location: @blog }
      else
        set_blog_categories
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog updated successfully' }
        format.json { render :show, status: :ok, location: @blog }
      else
        set_blog_categories
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy!

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id].to_s.split('-').first)
  end

  def set_blog_categories
    @blog_categories = Category.where(area: 'blog')
  end

  def blog_params
    params.require(:blog).permit(:title, :author, :body, :description, :preview,
                                 blog_categories_attributes: %i[id category_id _destroy])
  end

  def record_not_found
    respond_to do |format|
      format.html { redirect_to blogs_url, alert: 'Blog not found.' }
      format.json { render json: { error: 'Blog not found' }, status: :not_found }
    end
  end
end

