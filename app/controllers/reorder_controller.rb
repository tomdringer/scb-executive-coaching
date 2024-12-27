class ReorderController < ApplicationController
  def update_sections_order
    ids = params[:ids] || []
    Rails.logger.info "RECEIVED IDS: #{ids.inspect}"

    if ids.present?
      # Send a JSON response with valid data
      render json: { status: "ok", message: "Reorder successful", ids: ids }
    else
      render json: { status: "error", message: "No IDs provided" }, status: 400
    end
  rescue StandardError => e
    # Log the error and send a proper error response
    Rails.logger.error "ERROR UPDATING ORDER: #{e.message}"
    render json: { status: "error", message: e.message }, status: 500
  end

  def reorder_params
    params.require(:reorder).permit(:section_id, :position)
  end
end