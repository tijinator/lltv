ElasticTranscoder::Transcoder::Base.amazon_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
}