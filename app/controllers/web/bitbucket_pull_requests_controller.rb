# frozen_string_literal: true

module Web
  class BitbucketPullRequestsController < ApplicationController
    def index
      @pull_requests = Bitbucket::PullRequest.ordered_by_newest.ransack(params[:q]).result
    end
  end
end
