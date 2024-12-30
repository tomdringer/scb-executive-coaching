class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  # List all policies
  def index
    @policies = Policy.all
  end

  # Show a single policy
  def show
  end

  # Form for a new policy
  def new
    @policy = Policy.new
  end

  # Create a new policy
  def create
    @policy = Policy.new(policy_params)
    if @policy.save
      redirect_to @policy, notice: 'Policy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Form to edit a policy
  def edit
  end

  # Update an existing policy
  def update
    if @policy.update(policy_params)
      redirect_to @policy, notice: 'Policy was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete a policy
  def destroy
    @policy.destroy
    redirect_to policies_path, notice: 'Policy was successfully deleted.'
  end

  private

  # Find the policy based on the ID
  def set_policy
    @policy = Policy.find(params[:id])
  end

  # Whitelist policy parameters
  def policy_params
    params.require(:policy).permit(:title, :content)
  end
end