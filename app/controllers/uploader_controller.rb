require 'aws-sdk-s3'
class UploaderController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:image]
  def image
    begin
      s3 = Aws::S3::Resource.new(
        region: 'eu-west-2',
        credentials: Aws::Credentials.new(
          Rails.application.credentials.dig(:aws, :access_key_id),
          Rails.application.credentials.dig(:aws, :secret_access_key)
        )
      )

      file = params[:file]
      if file.nil?
        render json: { error: 'No file provided' }, status: :unprocessable_entity
        return
      end

      obj = s3.bucket('scb-coaching-images').object(file.original_filename)
      obj.upload_file(file.path, acl: 'public-read')

      render json: { url: obj.public_url }
    rescue Aws::Errors::ServiceError => e
      Rails.logger.error "AWS Service Error: #{e.message}"
      render json: { error: e.message }, status: :unprocessable_entity
    rescue StandardError => e
      Rails.logger.error "Standard Error: #{e.message}"
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end