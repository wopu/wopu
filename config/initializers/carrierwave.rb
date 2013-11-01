CarrierWave.configure do |config|
  # TODO move credentials to config file
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'perro',
    :aws_secret_access_key  => 'perro'
  }

  config.fog_directory  = 'wopu' # Bucket name
end