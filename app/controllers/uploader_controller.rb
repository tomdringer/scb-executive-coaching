class UploaderController < ApplicationController
  def image
    s3 = Aws::S3::Resource.new(
      region: 'eu-west-2',
      credentials: Aws::Credentials.new(
        Rails.application.credentials.dig(:aws, :access_key_id),
        Rails.application.credentials.dig(:aws, :secret_access_key)
      )
    )

    file = params[:file]
    obj = s3.bucket('scb-coaching-images').object(file.original_filename)
    obj.upload_file(file.path, acl: 'public-read')

    render json: { url: obj.public_url }
  rescue Aws::Errors::ServiceError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end