OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '371279772953499','b4d9bfe37a789b8bd16703a5883e82f0'
end