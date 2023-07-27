# frozen_string_literal: true

class Api::BitbucketPullRequestsController < ApplicationController
  def index
    pull_requests = Bitbucket::PullRequest.all
    render json: pull_requests.to_json
  end

  def refresh
    BitbucketPullRequests::Refresh.perform

    render json: { seccess: true }
  end
end
