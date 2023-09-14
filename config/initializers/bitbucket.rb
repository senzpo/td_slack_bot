# frozen_string_literal: true

# https://github.com/hirakiuc/tinybucket
Tinybucket.configure do |config|
  config.oauth_token = ENV.fetch('BITBUCKET_OAUTH_TOKEN', nil)
  config.oauth_secret = ENV.fetch('BITBUCKET_OAUTH_SECRET', nil)
end
