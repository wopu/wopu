CarrierWave.configure do |config|
  if Global.aws.fog_storage_enabled
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Global.aws.access_key_id,
      :aws_secret_access_key  => Global.aws.secret_access_key
    }

    config.fog_directory  = 'wopu' # Bucket name
    config.storage = :fog
  else
    config.storage = :file
  end
end
