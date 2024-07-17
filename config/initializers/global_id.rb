# config/initializers/global_id.rb
require 'active_support/message_verifier'

Rails.application.config.to_prepare do
  key_generator = ActiveSupport::KeyGenerator.new(
    Rails.application.secret_key_base,
    iterations: 1000
  )

  secret = key_generator.generate_key('signed global id')
  verifier = ActiveSupport::MessageVerifier.new(secret)

  GlobalID::Locator.verifier = verifier
end