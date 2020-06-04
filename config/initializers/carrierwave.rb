CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAV6UBG2X42Z7HNLOT',       # required unless using use_iam_profile
    aws_secret_access_key: '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',  # required unless using use_iam_profile
    use_iam_profile:       true,                         # optional, defaults to false
    region:                'us-east-2'                  # optional, defaults to 'us-east-1'

  }
  config.fog_directory  = 'rails-tutorial-screencast' # required
  config.fog_public     = false  # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end

# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:                'AWS',
#     aws_access_key_id:        ENV['AWS_ACCESS_KEY_ID'],
#     aws_secret_access_key:    ENV['AWS_SECRET_ACCESS_KEY_ID'],
#     region:                   ENV['S3_REGION']
#   }
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_directory = ENV['S3_BUCKET_NAME']
# end
