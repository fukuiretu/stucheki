Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
  Settings.twitter.consumer_key,
  Settings.twitter.consumer_secret,
  {
    secure_image_url: 'true',
    image_size: 'mini'
  }
end
