# frozen_string_literal: true

module Web
  class BitbucketPullRequestsController < ApplicationController
    def index
      @pull_requests = Bitbucket::PullRequest.all
    end
  end
end
