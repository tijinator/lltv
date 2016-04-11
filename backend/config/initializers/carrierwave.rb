# CarrierWave.configure do |config|
#   config.storage    = :aws
#   config.aws_bucket = ENV.fetch('S3_BUCKET')
#   config.aws_acl    = 'public-read'

#   config.aws_credentials = {
#     access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
#     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#     region:            ENV.fetch('AWS_REGION') # Required
#   }

# end

CarrierWave.configure do |config|

  config.storage    = :aws
  config.aws_bucket = 'lltv-demo'
  config.aws_acl    = :public_read
  # config.asset_host = 'https://mybucketname.s3-us-west-1.amazonaws.com'
  # config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    # Configuration for Amazon S3
    # access_key_id:         ENV.fetch('AWS_ACCESS_KEY_ID'),
    # secret_access_key:     ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    # region:                'us-east-1'
  }

   config.storage = :aws
   # config.cache_dir = "#{Rails.root}/tmp/uploads"

end
