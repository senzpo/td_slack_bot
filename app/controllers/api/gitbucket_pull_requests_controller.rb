# frozen_string_literal: true

module Api
  class GitbucketPullRequestsController < ApplicationController
    def index

      # https://github.com/hirakiuc/tinybucket
      Tinybucket.configure do |config|
        config.oauth_token = 'evrH3mHNASE2zr7QpZ'
        config.oauth_secret = 'RMXVvmcVyRPhnJG8ChxzrpsXDhMZdadU'
      end

      bucket = Tinybucket.new

      public_repo = bucket.repo('taxesforexpats', 'taxdome')

      public_repo.pull_requests.each do |pull|
        puts pull
      end

      

      render json: { merge_requests: 'test' }
    end
  end
end
