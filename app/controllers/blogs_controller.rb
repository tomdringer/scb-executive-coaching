class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @blog.blog_categories.build
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    @blog.blog_categories.build if @blog.blog_categories.empty?
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: "Post created successfully"
    else
      render :new
    end
  end


  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog updated successfully"
    else
      render :edit, alert: "There was an error updating the blog"
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy!

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :author, :body, :description, :preview, blog_categories_attributes: [:id, :category_id, :_destroy])
  end
end
