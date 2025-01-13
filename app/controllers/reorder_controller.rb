class ReorderController < ApplicationController
  protect_from_forgery with: :null_session

  def update_sections_order
    ids = params[:ids]
    ids.each_with_index do |id, index|
      section = Section.find_by(id: id)
      section.update(position: index + 1) if section
    end

    render json: { message: 'Sections reordered successfully' }, status: :ok
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end

