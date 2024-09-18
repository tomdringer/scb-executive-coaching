# app/controllers/uploader_controller.rb
require 'aws-sdk-s3'
class UploaderController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:image]
  skip_forgery_protection

  def image
    if params[:file].present?
      blob = ActiveStorage::Blob.create_and_upload!(
        io: params[:file],
        filename: params[:file].original_filename,
        content_type: params[:file].content_type
      )

      render json: { location: url_for(blob) }, content_type: "text/html"
    else
      render json: { error: 'No file provided' }, status: :unprocessable_entity
    end
  end
end