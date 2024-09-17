class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: 'Review was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
      if @review.update(review_params)
        redirect_to root_path, notice: 'Review was successfully added.'
      else 
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
   @review.destroy
    redirect_to root_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:body, :author, :body_text_colour, :body_text_size, :link_colour)
  end
end
