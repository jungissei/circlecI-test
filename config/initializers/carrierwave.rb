
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :fog

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION']
    }

    config.fog_directory  = ENV['AWS_BUCKET_NAME']
    config.asset_host = ENV['AWS_BUCKET_URL']
    config.cache_storage = :fog
  end
end