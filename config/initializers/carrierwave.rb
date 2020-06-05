CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    # aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    # aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: ENV['S3_REGION']
  }
  config.fog_directory  = ENV['S3_BUCKET']
  config.fog_public = false
  config.storage = :fog
end
