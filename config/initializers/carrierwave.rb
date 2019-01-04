require 'carrierwave'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['CARRIERWAVE_AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['CARRIERWAVE_AWS_SECRET_ACCESS_KEY'],
    # use_iam_profile:       true,                         # optional, defaults to false
    region:                ENV['CARRIERWAVE_AWS_REGION'],
  }
  config.fog_directory  = ENV['CARRIERWAVE_S3_BUCKET']
  config.fog_public     = true                                                  # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{1.hour.to_i}" } # optional, defaults to {}
end