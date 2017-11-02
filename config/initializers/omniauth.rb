# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
# end
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "310059986027-gt026eq6clp1lr9hq53kmqs60hdqlq89.apps.googleusercontent.com", "1BWLyquxt8zcqWidXa8uZ1ce", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
