# app/controllers/uploader_controller.rb
require 'aws-sdk-s3'

class UploaderController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:image]

  def image
    return render json: { error: 'No file provided' }, status: :unprocessable_entity unless params[:file].present?

    begin
      blob = ActiveStorage::Blob.create_and_upload!(
        io: params[:file],
        filename: params[:file].original_filename,
        content_type: params[:file].content_type
      )

      # Generate the URL
      image_url = if Rails.env.production?
                    Rails.application.routes.url_helpers.rails_blob_url(blob, host: "https://your-production-domain.com")
                  else
                    Rails.application.routes.url_helpers.rails_blob_url(blob, host: "https://scb-96.localcan.dev")
                  end

      # Log the generated URL for debugging purposes
      Rails.logger.info("Generated image URL: #{image_url}")

      # Return the URL in the appropriate format for TinyMCE
      render json: { location: image_url }, status: :ok
    rescue ActiveStorage::IntegrityError => e
      Rails.logger.error("ActiveStorage integrity error: #{e.message}")
      render json: { error: 'Invalid file upload.' }, status: :unprocessable_entity
    rescue ActiveStorage::Blob::BuildError => e
      Rails.logger.error("Error building the blob: #{e.message}")
      render json: { error: 'Error in image upload.' }, status: :unprocessable_entity
    rescue StandardError => e
      Rails.logger.error("Image upload error: #{e.message}")
      render json: { error: 'Something went wrong during upload.' }, status: :unprocessable_entity
    end
  end
end