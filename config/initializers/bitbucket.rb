# frozen_string_literal: true

# https://github.com/hirakiuc/tinybucket
Tinybucket.configure do |config|
  config.oauth_token = ENV['BITBUCKET_OAUTH_TOKEN']
  config.oauth_secret = ENV['BITBUCKET_OAUTH_SECRET']
end
