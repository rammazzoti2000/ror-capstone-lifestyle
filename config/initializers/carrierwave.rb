CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = ‘fog/aws’
    config.fog_credentials = {
      :provider => ‘AWS’,
      :aws_access_key_id => ENV[‘AWS_ACCESS_KEY_ID’],
      :aws_secret_access_key => ENV[‘AWS_SECRET_ACCESS_KEY’],
      :region => ‘eu-west-3’ # Paris
    }
    config.fog_directory = ENV[‘S3_BUCKET_NAME’]
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end
