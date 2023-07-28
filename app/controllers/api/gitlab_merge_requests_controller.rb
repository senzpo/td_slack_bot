# frozen_string_literal: true

module Api
  class GitlabMergeRequestsController < ApplicationController
    def index
      # merge_requests = Gitlab::MergeRequest.all
      # render json: merge_requests.to_json

      merge_request_events = Gitlab::MergeRequestEvent.all
      render json: merge_request_events.to_json
    end

    def refresh
      raw_merge_requests = GitlabHelper.get_merge_requests
      GitlabMergeRequests::Refresh.perform(raw_merge_requests)
    end
  end
end
