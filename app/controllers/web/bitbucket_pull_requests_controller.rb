# frozen_string_literal: true

class Web::BitbucketPullRequestsController < ApplicationController
  def index
    @pull_requests = Bitbucket::PullRequest.all
  end
end
