Rails.application.config.after_initialize do
  if Rails.application.secrets.secret_key_base
    SignedGlobalID.verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end
end