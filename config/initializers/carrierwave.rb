CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIRTVLGLU34BRNEMQ',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = 'com.di.andi' if Rails.env.production?
  config.fog_directory = 'com.di.andi' if Rails.env.development?

end