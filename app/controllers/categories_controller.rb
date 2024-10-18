class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  def create
    @category = Category.new(category_params)
    @category.article_id = params[:category][:article_id] # Assign the article ID

    if @category.save
      respond_to do |format|
        format.json { render json: @category, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :article_id)
  end
end