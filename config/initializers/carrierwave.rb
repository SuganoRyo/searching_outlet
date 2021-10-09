unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'searching-outlet-test'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARYLFXZ3HQTHQKMTE',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }
  end
end
