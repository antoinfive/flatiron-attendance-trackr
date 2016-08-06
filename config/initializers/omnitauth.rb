Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :learn, ENV['LEARN_CLIENT_ID'], ENV['LEARN_CLIENT_SECRET'],
  provider_ignores_state: true
end
