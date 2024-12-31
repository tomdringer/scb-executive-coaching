class CoachingsController < ApplicationController
  before_action :set_coaching, only: %i[ show edit update destroy ]

  # GET /coachings or /coachings.json
  def index
    @coachings = Coaching.all
  end

  # GET /coachings/1 or /coachings/1.json
  def show
  end

  # GET /coachings/new
  def new
    @coaching = Coaching.new
  end

  # GET /coachings/1/edit
  def edit
  end

  # POST /coachings or /coachings.json
  def create
    @coaching = Coaching.new(coaching_params)

    respond_to do |format|
      if @coaching.save
        format.html { redirect_to coaching_url(@coaching), notice: "Coaching was successfully created." }
        format.json { render :show, status: :created, location: @coaching }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coaching.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coachings/1 or /coachings/1.json
  def update
    respond_to do |format|
      if @coaching.update(coaching_params)
        format.html { redirect_to coaching_url(@coaching), notice: "Coaching was successfully updated." }
        format.json { render :show, status: :ok, location: @coaching }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coaching.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coachings/1 or /coachings/1.json
  def destroy
    @coaching.destroy!

    respond_to do |format|
      format.html { redirect_to coachings_url, notice: "Coaching was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coaching
      @coaching = Coaching.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coaching_params
      params.require(:coaching).permit(:title, :description)
    end
end
